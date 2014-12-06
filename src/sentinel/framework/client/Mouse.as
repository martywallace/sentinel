package sentinel.framework.client
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import sentinel.framework.Component;
	import sentinel.framework.events.MouseEvent;
	import sentinel.framework.Game;
	
	
	/**
	 * Dispatched when the left mouse button is pressed.
	 * @eventType sentinel.events.MouseEvent.LEFT_DOWN
	 */
	[Event(name = 'leftDown', type = 'sentinel.events.MouseEvent')]
	
	/**
	 * Dispatched when the left mouse button is released.
	 * @eventType sentinel.events.MouseEvent.LEFT_UP
	 */
	[Event(name = 'leftUp', type = 'sentinel.events.MouseEvent')]
	
	/**
	 * Dispatched when the right mouse button is pressed.
	 * @eventType sentinel.events.MouseEvent.RIGHT_DOWN
	 */
	[Event(name = 'rightDown', type = 'sentinel.events.MouseEvent')]
	
	/**
	 * Dispatched when the right mouse button is released.
	 * @eventType sentinel.events.MouseEvent.RIGHT_UP
	 */
	[Event(name='rightUp', type='sentinel.events.MouseEvent')]
	
	
	/**
	 * The Mouse class provides access to the current state of the mouse buttons.
	 * @author Marty Wallace.
	 */
	public class Mouse extends Component
	{
		
		private var _game:Game;
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _available:Boolean = false;
		
		
		public function Mouse(game:Game)
		{
			_game = game;
			
			_game.starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_UP, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(flash.events.MouseEvent.RIGHT_MOUSE_DOWN, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(flash.events.MouseEvent.RIGHT_MOUSE_UP, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, _mouseEventHandler);
		}
		
		
		private function _mouseEventHandler(event:flash.events.MouseEvent):void
		{
			if(event.type === flash.events.MouseEvent.MOUSE_DOWN || event.type === flash.events.MouseEvent.MOUSE_UP)
			{
				_left = event.type === flash.events.MouseEvent.MOUSE_DOWN;
				dispatchEvent(new sentinel.framework.events.MouseEvent(event.type === flash.events.MouseEvent.MOUSE_DOWN ? sentinel.framework.events.MouseEvent.LEFT_DOWN : sentinel.framework.events.MouseEvent.LEFT_UP));
			}
			
			if(event.type === flash.events.MouseEvent.RIGHT_MOUSE_DOWN || event.type === flash.events.MouseEvent.RIGHT_MOUSE_UP)
			{
				_right = event.type === flash.events.MouseEvent.RIGHT_MOUSE_DOWN;
				dispatchEvent(new sentinel.framework.events.MouseEvent(event.type === flash.events.MouseEvent.RIGHT_MOUSE_DOWN ? sentinel.framework.events.MouseEvent.RIGHT_DOWN : sentinel.framework.events.MouseEvent.RIGHT_UP));
			}
			
			if(event.type === flash.events.MouseEvent.MOUSE_MOVE)
			{
				_game.starling.nativeStage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, _mouseEventHandler);
				_game.starling.nativeStage.addEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
				
				_available = true;
			}
		}
		
		
		private function _mouseLeaveHandler(event:Event):void
		{
			_game.starling.nativeStage.removeEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
			_game.starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, _mouseEventHandler);
			
			_available = false;
		}
		
		
		/**
		 * Returns the current state of the mouse buttons as a <code>MouseState</code> object.
		 * @return
		 */
		public function getState():MouseState
		{
			var viewportPosition:Point = new Point(_game.starling.nativeStage.mouseX, _game.starling.nativeStage.mouseY);
			
			return new MouseState(viewportPosition, _left, _right, _available);
		}
		
		
		public override function get name():String { return 'mouse'; }
		
	}
	
}