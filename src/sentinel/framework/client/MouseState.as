package sentinel.framework.client
{
	
	import flash.geom.Point;
	import sentinel.framework.util.StringUtil;
	
	
	public class MouseState
	{
		
		private var _position:Point;
		private var _left:Boolean;
		private var _right:Boolean;
		private var _available:Boolean;
		
		
		public function MouseState(position:Point, left:Boolean, right:Boolean, available:Boolean)
		{
			_position = position;
			_left = left;
			_right = right;
			_available = available;
		}
		
		
		public function toString():String
		{
			return StringUtil.toDebugString(["x","y","left","right","available"], [
				position.x, position.y,
				left, right,
				available
			]);
		}
		
		
		public function equals(mouseState:MouseState):Boolean
		{
			return position.equals(mouseState.position) && left === mouseState.left && right === mouseState.right && available === mouseState.available;
		}
		
		
		public function get position():Point{ return _position; }
		public function get left():Boolean{ return _left; }
		public function get right():Boolean{ return _right; }
		public function get available():Boolean{ return _available; }
		
	}
	
}