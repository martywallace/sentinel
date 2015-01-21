package sentinel.framework.client
{
	
	import sentinel.framework.util.StringUtil;
	import starling.geom.Point;
	
	
	/**
	 * Stores information about the state of the user's mouse at a given point in time.
	 * @author Marty Wallace.
	 */
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
				_position.x, _position.y,
				left, right,
				available
			]);
		}
		
		
		/**
		 * The position of the mouse pointer relative to the viewport.
		 */
		public function get viewportPosition():Point{ return _position; }
		
		/**
		 * Whether or not the left mouse button is held down.
		 */
		public function get left():Boolean { return _left; }
		
		/**
		 * Whether or not the right mouse button is held down.
		 */
		public function get right():Boolean { return _right; }
		
		/**
		 * Whether or not the cursor is within the viewport.
		 */
		public function get available():Boolean{ return _available; }
		
	}
	
}