package sentinel.base
{
	
	import sentinel.contracts.IConstructs;
	import sentinel.contracts.IUpdates;
	import sentinel.user.Keyboard;
	import sentinel.user.Mouse;
	import sentinel.user.Viewport;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	
	
	public class Game extends Sprite implements IConstructs, IUpdates
	{
		
		private var _viewport:Viewport;
		private var _keyboard:Keyboard;
		private var _mouse:Mouse;
		
		
		public function Game()
		{
			_viewport = new Viewport(this);
			_mouse = new Mouse(this);
			_keyboard = new Keyboard(this);
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, _update);
		}
		
		
		public function construct():void
		{
			//
		}
		
		
		private function _update(event:EnterFrameEvent):void
		{
			update();
		}
		
		
		public function update():void
		{
			//
		}
		
		
		public function get starling():Starling{ return Starling.current; }
		public function get viewport():Viewport{ return _viewport; }
		public function get keyboard():Keyboard{ return _keyboard; }
		public function get mouse():Mouse{ return _mouse; }
		
	}
	
}