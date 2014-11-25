package sentinel.framework
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Viewport;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.sound.Audio;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.EnterFrameEvent;
	
	
	/**
	 * The core game class passed to the constructor of <code>sentinel.framework.Core</code>. This
	 * is the base class for your main game class and should contain logic for initializing assets
	 * and the starting state.
	 * @author Marty Wallace.
	 */
	public class Game extends Sprite
	{
		
		private var _state:State;
		private var _viewport:Viewport;
		private var _keyboard:Keyboard;
		private var _mouse:Mouse;
		private var _library:Library;
		private var _audio:Audio;
		
		
		public function Game()
		{
			_viewport = new Viewport(this);
			_mouse = new Mouse(this);
			_keyboard = new Keyboard(this);
			_library = new Library();
			_audio = new Audio(_library)
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, _update);
		}
		
		
		public function construct():void
		{
			//
		}
		
		
		/**
		 * Loads a new State. Unloads the current state, if one is set.
		 * @param state The new State to load.
		 */
		public function loadState(state:State):void
		{
			if (_state !== null)
			{
				_state.deconstruct();
			}
			
			_state = state;
			addChild(_state.graphics as DisplayObject);
		}
		
		
		private function _update(event:EnterFrameEvent):void
		{
			update();
			
			if (_state !== null)
			{
				_state.__update();
			}
		}
		
		
		protected function update():void
		{
			//
		}
		
		
		public function get starling():Starling { return Starling.current; }
		public function get state():State { return _state; }
		public function get keyboard():Keyboard{ return _keyboard; }
		public function get mouse():Mouse { return _mouse; }
		public function get library():Library { return _library; }
		public function get audio():Audio { return _audio; }
		
		
		public override function get viewport():Viewport{ return _viewport; }
		
	}
	
}