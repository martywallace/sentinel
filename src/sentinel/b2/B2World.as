package sentinel.b2
{
	
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	import sentinel.contracts.IUpdates;
	import sentinel.contracts.IDeconstructs;
	
	
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
		}
		
		
		public function deconstruct():void
		{
			if (_debug !== null)
			{
				_debug.deconstruct();
			}
			
			// TODO:
			// Destroy child bodies & call deconstruct on each.
			// ...
		}
		
		
		/**
		 * Creates a new B2Body within this world.
		 * 
		 * @param type The body type. Defaults to B2Body.DYNAMIC.
		 * 
		 * @return The new B2Body.
		 */
		public function createBody(type:int = 2):B2Body
		{
			var def:b2BodyDef = new b2BodyDef();
			def.type = type;
			
			var body:b2Body = _base.CreateBody(def);
			
			return new B2Body(body, def);
		}
		
		
		public function destroyBody(body:B2Body):void
		{
			body.destroyAllFixtures();
			_base.DestroyBody(body.base);
		}
		
		
		public function update():void
		{
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
		
	}
	
}