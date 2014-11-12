package sentinel.b2
{
	
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	import sentinel.base.IUpdates;
	import sentinel.base.IDeconstructs;
	
	
	/**
	 * Wrapper for Box2D.Dynamics.b2World.
	 * 
	 * @author Marty Wallace.
	 */
	public class B2World implements IUpdates, IDeconstructs
	{
		
		private static var _scale:int = 30;
		
		
		/**
		 * The pixel to metre scaling ratio.
		 */
		public static function get scale():int { return _scale; }
		public static function set scale(value:int):void { _scale = value; }
		
		
		private var _base:b2World;
		private var _def:B2WorldDef;
		private var _debug:B2Debug;
		private var _destroyed:Vector.<B2Body> = new <B2Body>[];
		
		
		/**
		 * Constructor.
		 * 
		 * @param def An optional world definition.
		 * @param debug An optional debug definition.
		 */
		public function B2World(def:B2WorldDef = null, debug:B2Debug = null)
		{
			_def = def === null ? new B2WorldDef(new B2Vector2D()) : def;
			_base = new b2World(_def.gravity.base, _def.sleep);
			_debug = debug;
			
			if (debug !== null)
			{
				_base.SetDebugDraw(debug.base);
			}
			
			_base.SetContactListener(new B2ContactListener());
		}
		
		
		public function deconstruct():void
		{
			if (_debug !== null)
			{
				_debug.deconstruct();
				_debug = null;
			}
			
			for each(var body:B2Body in bodies)
			{
				body.deconstruct();
			}
			
			// Update is required to iterate over the destroyed bodies above and actually
			// destroy them.
			update();
			
			// TODO: Anything with forces? Etc?
			// ...
		}
		
		
		/**
		 * Creates a new B2Body within this world.
		 * @param type The body type. Defaults to B2Body.DYNAMIC.
		 * @return The new B2Body.
		 */
		public function createBody(type:int = 2):B2Body
		{
			var def:b2BodyDef = new b2BodyDef();
			def.type = type;
			
			var body:b2Body = _base.CreateBody(def);
			
			return new B2Body(this, body, def);
		}
		
		
		internal function __destroyBody(body:B2Body):void
		{
			if(_destroyed.indexOf(body) < 0) _destroyed.push(body);
		}
		
		
		public function update():void
		{
			while (_destroyed.length > 0)
			{
				var d:B2Body = _destroyed.pop();
				_base.DestroyBody(d.base);
				
				d.deconstruct();
			}
			
			_base.Step(1 / 60, _def.velocityIterations, _def.positionIterations);
			_base.ClearForces();
			
			if (_debug !== null)
			{
				_base.DrawDebugData();
			}
		}
		
		
		public function get base():b2World{ return _base; }
		public function get sleeps():Boolean{ return _def.sleep; }
		public function get gravity():B2Vector2D { return _def.gravity; }
		public function get debugging():Boolean { return _debug !== null; }
		public function get numBodies():int { return _base.GetBodyCount(); }
		
		
		public function get bodies():Vector.<B2Body>
		{
			var result:Vector.<B2Body> = new <B2Body>[];
			var start:b2Body = _base.GetBodyList();
			
			while (start !== null)
			{
				if (start.GetUserData() !== null && start.GetUserData() is B2BodyData)
				{
					result.push((start.GetUserData() as B2BodyData).body);
				}
				
				start = start.GetNext();
			}
			
			return result;
		}
		
	}
	
}