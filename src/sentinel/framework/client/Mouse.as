package sentinel.framework.client
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import sentinel.framework.Component;
	import sentinel.framework.events.MouseEvent;
	import sentinel.framework.IMouseDataProvider;
	import sentinel.gameplay.physics.Vector2D;
	
	
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
		
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _available:Boolean = false;
		
		
		protected override function construct():void
		{
			starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, _mouseEventHandler);
			starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_UP, _mouseEventHandler);
			starling.nativeStage.addEventListener(flash.events.MouseEvent.RIGHT_MOUSE_DOWN, _mouseEventHandler);
			starling.nativeStage.addEventListener(flash.events.MouseEvent.RIGHT_MOUSE_UP, _mouseEventHandler);
			starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, _mouseEventHandler);
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
				starling.nativeStage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, _mouseEventHandler);
				starling.nativeStage.addEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
				
				_available = true;
			}
		}
		
		
		private function _mouseLeaveHandler(event:Event):void
		{
			starling.nativeStage.removeEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
			starling.nativeStage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, _mouseEventHandler);
			
			_available = false;
		}
		
		
		/**
		 * Returns the current state of the mouse buttons as a <code>MouseState</code> object.
		 */
		public function getState():MouseState
		{
			var viewportPosition:Point = new Point(starling.nativeStage.mouseX, starling.nativeStage.mouseY);
			
			return new MouseState(viewportPosition, _left, _right, _available);
		}
		
		
		/**
		 * Returns the position of the mouse within a given object.
		 * @param within The mouse data provider to get the mouse position within.
		 */
		public function getPosition(within:IMouseDataProvider):Vector2D
		{
			return within.getMousePosition(this);
		}
		
		
		public override function get name():String { return 'mouse'; }
		
	}
	
}