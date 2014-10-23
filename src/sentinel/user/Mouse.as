package sentinel.user
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import sentinel.base.Game;
	import sentinel.events.MouseEvent;
	
	import starling.events.EventDispatcher;
	
	
	public class Mouse extends EventDispatcher
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
				dispatchEvent(new sentinel.events.MouseEvent(event.type === flash.events.MouseEvent.MOUSE_DOWN ? sentinel.events.MouseEvent.LEFT_DOWN : sentinel.events.MouseEvent.LEFT_UP));
			}
			
			if(event.type === flash.events.MouseEvent.RIGHT_MOUSE_DOWN || event.type === flash.events.MouseEvent.RIGHT_MOUSE_UP)
			{
				_right = event.type === flash.events.MouseEvent.RIGHT_MOUSE_DOWN;
				dispatchEvent(new sentinel.events.MouseEvent(event.type === flash.events.MouseEvent.RIGHT_MOUSE_DOWN ? sentinel.events.MouseEvent.RIGHT_DOWN : sentinel.events.MouseEvent.RIGHT_UP));
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
		
		
		public function getState():MouseState
		{
			var viewportPosition:Point = new Point(_game.starling.nativeStage.mouseX, _game.starling.nativeStage.mouseY);
			
			return new MouseState(viewportPosition, _left, _right, _available);
		}
		
	}
	
}