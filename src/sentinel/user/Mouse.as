package sentinel.user
{
	
	import flash.geom.Point;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import sentinel.base.Game;
	
	
	public class Mouse
	{
		
		private var _game:Game;
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _available:Boolean = false;
		
		
		public function Mouse(game:Game)
		{
			_game = game;
			
			_game.starling.nativeStage.addEventListener(MouseEvent.MOUSE_DOWN, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(MouseEvent.MOUSE_UP, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, _mouseEventHandler);
			_game.starling.nativeStage.addEventListener(MouseEvent.MOUSE_MOVE, _mouseEventHandler);
		}
		
		
		private function _mouseEventHandler(event:Event):void
		{
			if(event.type === MouseEvent.MOUSE_DOWN || event.type === MouseEvent.MOUSE_UP)
			{
				_left = event.type === MouseEvent.MOUSE_DOWN;
			}
			
			if(event.type === MouseEvent.RIGHT_MOUSE_DOWN || event.type === MouseEvent.RIGHT_MOUSE_UP)
			{
				_right = event.type === MouseEvent.RIGHT_MOUSE_DOWN;
			}
			
			if(event.type === MouseEvent.MOUSE_MOVE)
			{
				_game.starling.nativeStage.removeEventListener(MouseEvent.MOUSE_MOVE, _mouseEventHandler);
				_game.starling.nativeStage.addEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
				
				_available = true;
			}
		}
		
		
		private function _mouseLeaveHandler(event:Event):void
		{
			_game.starling.nativeStage.removeEventListener(Event.MOUSE_LEAVE, _mouseLeaveHandler);
			_game.starling.nativeStage.addEventListener(MouseEvent.MOUSE_MOVE, _mouseEventHandler);
			
			_available = false;
		}
		
		
		public function getState():MouseState
		{
			var viewportPosition:Point = new Point(_game.starling.nativeStage.mouseX, _game.starling.nativeStage.mouseY);
			
			return new MouseState(viewportPosition, _left, _right, _available);
		}
		
	}
	
}