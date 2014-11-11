package sentinel.b2
{
	
	import Box2D.Dynamics.b2DebugDraw;
	import flash.display.Sprite;
	import sentinel.base.Game;
	
	
	public class B2Debug
	{
		
		public static const AABB:int = b2DebugDraw.e_aabbBit;
		public static const CENTER_OF_MASS:int = b2DebugDraw.e_centerOfMassBit;
		public static const CONTROLLER:int = b2DebugDraw.e_controllerBit;
		public static const JOINT:int = b2DebugDraw.e_jointBit;
		public static const PAIR:int = b2DebugDraw.e_pairBit;
		public static const SHAPE:int = b2DebugDraw.e_shapeBit;
		
		
		private var _game:Game;
		private var _base:b2DebugDraw;
		private var _graphics:Sprite;
		
		
		public function B2Debug(game:Game, lineThickness:int = 1, lineAlpha:Number = 1, fillAlpha:Number = 0.2, flags:Vector.<int> = null)
		{
			_game = game;
			
			_graphics = new Sprite();
			_base = new b2DebugDraw();
			
			_base.SetSprite(_graphics);
			_base.SetDrawScale(B2World.scale);
			_base.SetLineThickness(lineThickness);
			_base.SetAlpha(lineAlpha);
			_base.SetFillAlpha(fillAlpha);
			
			for each(var i:int in flags)
			{
				_base.AppendFlags(i);
			}
			
			game.starling.nativeOverlay.addChild(_graphics);
		}
		
		
		public function get graphics():Sprite { return _graphics; }
		public function get base():b2DebugDraw { return _base; }
		
	}
	
}