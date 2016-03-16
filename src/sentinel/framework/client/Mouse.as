package sentinel.framework.client {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import sentinel.framework.events.EventDispatcher;
	import sentinel.framework.events.MouseEvent;
	import starling.core.Starling;
	
	/**
	 * Dispatched when the left mouse button is pressed.
	 * @eventType sentinel.framework.events.MouseEvent.LEFT_DOWN
	 */
	[Event(name = 'leftDown', type = 'sentinel.events.MouseEvent')]
	
	/**
	 * Dispatched when the left mouse button is released.
	 * @eventType sentinel.framework.events.MouseEvent.LEFT_UP
	 */
	[Event(name = 'leftUp', type = 'sentinel.events.MouseEvent')]
	
	/**
	 * Dispatched when the right mouse button is pressed.
	 * @eventType sentinel.framework.events.MouseEvent.RIGHT_DOWN
	 */
	[Event(name = 'rightDown', type = 'sentinel.events.MouseEvent')]
	
	/**
	 * Dispatched when the right mouse button is released.
	 * @eventType sentinel.framework.events.MouseEvent.RIGHT_UP
	 */
	[Event(name='rightUp', type='sentinel.events.MouseEvent')]
	
	/**
	 * The Mouse class provides access to the current state of the mouse buttons.
	 * 
	 * @author Marty Wallace
	 */
	public class Mouse extends EventDispatcher {
		
		// FlashBuilder struggles to accept that MouseEvent.RIGHT_MOUSE_DOWN etc are real.
		// May as well add the other event types for completeness.
		private static const MOUSE_DOWN:String = 'mouseDown';
		private static const MOUSE_UP:String = 'mouseUp';
		private static const RIGHT_MOUSE_UP:String = 'rightMouseUp';
		private static const RIGHT_MOUSE_DOWN:String = 'rightMouseDown';
		private static const MOUSE_MOVE:String = 'mouseMove';
		
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _available:Boolean = false;
		
		public function Mouse() {
			Starling.current.nativeStage.addEventListener(MOUSE_DOWN, _mouseEventHandler);
			Starling.current.nativeStage.addEventListener(MOUSE_UP, _mouseEventHandler);
			Starling.current.nativeStage.addEventListener(RIGHT_MOUSE_DOWN, _mouseEventHandler);
			Starling.current.nativeStage.addEventListener(RIGHT_MOUSE_UP, _mouseEventHandler);
			Starling.current.nativeStage.addEventListener(MOUSE_MOVE, _mouseEventHandler);
		}
		
		private function _mouseEventHandler(event:flash.events.MouseEvent):void {
			if(event.type === MOUSE_DOWN || event.type === MOUSE_UP) {
				_left = event.type === MOUSE_DOWN;
				dispatchEvent(new sentinel.framework.events.MouseEvent(event.type === MOUSE_DOWN ? sentinel.framework.events.MouseEvent.LEFT_DOWN : sentinel.framework.events.MouseEvent.LEFT_UP));
			}
			
			if(event.type === RIGHT_MOUSE_DOWN || event.type === RIGHT_MOUSE_UP) {
				_right = event.type === RIGHT_MOUSE_DOWN;
				dispatchEvent(new sentinel.framework.events.MouseEvent(event.type === RIGHT_MOUSE_DOWN ? sentinel.framework.events.MouseEvent.RIGHT_DOWN : sentinel.framework.events.MouseEvent.RIGHT_UP));
			}
			
			if(event.type === MOUSE_MOVE) {
				Starling.current.nativeStage.removeEventListener(MOUSE_MOVE, _mouseEventHandler);
				Starling.current.nativeStage.addEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
				
				_available = true;
			}
		}
		
		private function _mouseLeaveHandler(event:Event):void {
			Starling.current.nativeStage.removeEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
			Starling.current.nativeStage.addEventListener(MOUSE_MOVE, _mouseEventHandler);
			
			_available = false;
		}
		
		/**
		 * Returns the current state of the mouse buttons as a <code>MouseState</code> object.
		 */
		public function getState():MouseState {
			return new MouseState(new Point(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY), _left, _right, _available);
		}
		
	}
	
}