package sentinel.gameplay.physics
{
	
	import Box2D.Common.Math.b2Mat22;
	import Box2D.Common.Math.b2Transform;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2World;
	import sentinel.framework.IDeconstructs;
	import sentinel.framework.Thing;
	
	
	/**
	 * Wrapper for Box2D.Dynamics.b2World.
	 * @author Marty Wallace.
	 */
	public class Engine implements IDeconstructs
	{
		
		private static var _scale:int = 30;
		
		
		/**
		 * The pixel to metre scaling ratio.
		 */
		public static function get scale():int { return _scale; }
		public static function set scale(value:int):void { _scale = value; }
		
		
		private var _base:b2World;
		private var _def:EngineDef;
		private var _debug:Debug;
		private var _destroyed:Vector.<Body> = new <Body>[];
		
		
		/**
		 * Constructor.
		 * @param def An optional world definition.
		 * @param debug An optional debug definition.
		 */
		public function Engine(def:EngineDef = null, debug:Debug = null)
		{
			_def = def === null ? new EngineDef(new Vector2D()) : def;
			_base = new b2World(_def.gravity.__base, _def.sleep);
			_debug = debug;
			
			if (debug !== null)
			{
				_base.SetDebugDraw(debug.__base);
			}
			
			_base.SetContactListener(new ContactListener());
		}
		
		
		public function deconstruct():void
		{
			if (_debug !== null)
			{
				_debug.deconstruct();
				_debug = null;
			}
			
			for each(var body:Body in bodies)
			{
				body.deconstruct();
			}
			
			// Update is required to iterate over the destroyed bodies above and actually
			// destroy them.
			step();
			
			// TODO: Anything with forces? Etc?
			// ...
		}
		
		
		/**
		 * Creates a new B2Body within this world.
		 * @param type The body type. Defaults to B2Body.DYNAMIC.
		 * @param owner An optional owner of the B2Body.
		 * @return The new B2Body.
		 */
		public function createBody(type:int = 2, owner:Thing = null):Body
		{
			var def:b2BodyDef = new b2BodyDef();
			def.type = type;
			
			var baseBody:b2Body = _base.CreateBody(def);
			
			return new Body(this, baseBody, def, owner);
		}
		
		
		/**
		 * Query the world for Fixtures who overlap a given point and return a list of
		 * <code>EngineQueryResult</code>s associated with those Fixtures.
		 * @param point The point to check at.
		 */
		public function queryPoint(point:Vector2D):Vector.<EngineQueryResult>
		{
			var result:Vector.<EngineQueryResult> = new <EngineQueryResult>[];
			
			_base.QueryPoint(function(fixture:b2Fixture):Boolean
			{
				if(fixture.GetUserData() !== null && fixture.GetUserData() is Fixture)
				{
					result.push(new EngineQueryResult(fixture.GetUserData() as Fixture), point);
				}
				
				return true;
				
			}, point.__base);
			
			return result;
		}
		
		
		/**
		 * Cast a line through the world and return a list of <code>EngineQueryResult</code>s
		 * containing data about each intersection made.
		 * @param start The line start position.
		 * @param end The line end position.
		 */
		public function queryLine(start:Vector2D, end:Vector2D):Vector.<EngineQueryResult>
		{
			var result:Vector.<EngineQueryResult> = new <EngineQueryResult>[];
			
			_base.RayCast(function(fixture:b2Fixture, point:b2Vec2, normal:b2Vec2, fraction:Number):Number
			{
				if (fixture.GetUserData() !== null && fixture.GetUserData() is Fixture)
				{
					result.push(new EngineQueryResult(
						fixture.GetUserData() as Fixture,
						Vector2D.__fromBase(point),
						Vector2D.__fromBase(normal)
					));
				}
				
				return 1;
				
			}, start.__base, end.__base);
			
			
			// Sort the list by distance from the start point.
			return result.sort(function(a:EngineQueryResult, b:EngineQueryResult):Number
			{
				var ad:Number = a.point.distanceTo(start);
				var bd:Number = b.point.distanceTo(start);
				
				return ad === bd ? 0 : (ad < bd ? -1 : 1); 
				
			});
		}
		
		
		/**
		 * Query the world for Fixtures who overlap a provided Shape and return a list of
		 * <code>EngineQueryResult</code>s associated with those Fixtures.
		 * @param shape The Shape to use.
		 * @param position The Shape position.
		 * @param rotation The Shape rotation.
		 */
		public function queryShape(shape:Shape, position:Vector2D, rotation:Number = 0):Vector.<EngineQueryResult>
		{
			var transform:b2Transform;
			
			if (rotation === 0)
			{
				// Don't need rotation.
				transform = new b2Transform(position.__base);
			}
			else
			{
				// Some kind of Box2D sorcery required for rotation.
				var mat22:b2Mat22 = new b2Mat22();
				mat22.Set(rotation);
				
				transform = new b2Transform(position.__base, mat22);
			}
			
			var result:Vector.<EngineQueryResult> = new <EngineQueryResult>[];
			
			_base.QueryShape(function(fixture:b2Fixture):Boolean
			{
				if(fixture.GetUserData() !== null && fixture.GetUserData() is Fixture)
				{
					result.push(new EngineQueryResult(fixture.GetUserData() as Fixture, position));
				}
				
				return true;
				
			}, shape.__base, transform);
			
			return result;
		}
		
		
		internal function __destroyBody(body:Body):void
		{
			if(_destroyed.indexOf(body) < 0) _destroyed.push(body);
		}
		
		
		/**
		 * Run one step of calculations within the physics world. Should be called each time the game
		 * World updates.
		 */
		public function step():void
		{
			while (_destroyed.length > 0)
			{
				var d:Body = _destroyed.pop();
				_base.DestroyBody(d.__base);
				
				d.deconstruct();
			}
			
			_base.Step(1 / 60, _def.velocityIterations, _def.positionIterations);
			_base.ClearForces();
			
			if (_debug !== null)
			{
				_base.DrawDebugData();
			}
		}
		
		
		/**
		 * Iterate over the list of bodies contained within this physics world and returns them as a
		 * Vector.<Body> list.
		 */
		public function get bodies():Vector.<Body>
		{
			var result:Vector.<Body> = new <Body>[];
			var start:b2Body = _base.GetBodyList();
			
			while (start !== null)
			{
				if (start.GetUserData() !== null && start.GetUserData() is BodyData)
				{
					result.push((start.GetUserData() as BodyData).body);
				}
				
				start = start.GetNext();
			}
			
			return result;
		}
		
		
		internal function get __base():b2World{ return _base; }
		
		public function get sleeps():Boolean{ return _def.sleep; }
		public function get gravity():Vector2D { return _def.gravity; }
		public function get debug():Debug { return _debug; }
		public function get debugging():Boolean { return _debug !== null; }
		public function get totalBodies():int { return _base.GetBodyCount(); }
		
	}
	
}