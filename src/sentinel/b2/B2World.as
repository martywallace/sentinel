package sentinel.b2
{
	
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2ContactListener;
	import flash.display.Sprite;
	import sentinel.base.Game;
	
	
	/**
	 * Wrapper for Box2D.Dynamics.b2World.
	 * 
	 * @author Marty Wallace.
	 */
	public class B2World
	{
		
		private static var _scale:int = 30;
		
		
		/**
		 * The pixel to metre scaling ratio.
		 */
		public static function get scale():int { return _scale; }
		public static function set scale(value:int):void { _scale = value; }
		
		
		private var _game:Game;
		private var _base:b2World;
		private var _def:B2WorldDef;
		private var _debugContainer:Sprite;
		private var _debugContent:Sprite;
		private var _debugDraw:b2DebugDraw;
		
		
		/**
		 * TODO: Allow providing of a B2Debug instance to specify the colors etc.
		 * 
		 * @param game
		 * @param def
		 * @param debug
		 */
		public function B2World(game:Game, def:B2WorldDef = null, debug:Boolean = false)
		{
			_game = game;
			_def = def === null ? new B2WorldDef(new B2Vector2D()) : def;
			_base = new b2World(_def.gravity.base, _def.sleep);
			
			if (debug)
			{
				_debugContent = new Sprite();
				_debugContainer = new Sprite();
				_debugContainer.addChild(_debugContent);
				
				_debugDraw = new b2DebugDraw();
				_debugDraw.SetSprite(_debugContent);
				_debugDraw.SetDrawScale(_scale);
				_debugDraw.SetLineThickness(1);
				_debugDraw.SetAlpha(0.3);
				_debugDraw.SetFillAlpha(0.15);
				_debugDraw.SetFlags(b2DebugDraw.e_shapeBit);
				
				_base.SetDebugDraw(_debugDraw);
				
				game.starling.nativeOverlay.addChild(_debugContainer);
			}
		}
		
		
		public function createBody(type:int = 1):B2Body
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
			
			if (debugMode)
			{
				_base.DrawDebugData();
			}
		}
		
		
		public function get base():b2World{ return _base; }
		public function get sleeps():Boolean{ return _def.sleep; }
		public function get gravity():B2Vector2D{ return _def.gravity; }
		public function get debugContainer():Sprite{ return _debugContainer; }
		public function get debugContent():Sprite{ return _debugContent; }
		public function get debugMode():Boolean{ return _debugContainer !== null; }
		
	}
	
}