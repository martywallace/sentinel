package sentinel.geom
{
	
	import flash.geom.Point;
	import sentinel.util.StringUtil;
	
	
	public class Vector2D
	{
		
		private var _base:Point;
		
		
		public function Vector2D(x:Number, y:Number)
		{
			_base = new Point(x, y);
		}
		
		
		public function toString():String
		{
			return StringUtil.toDebugString(['x', 'y'], [x, y]);
		}
		
		
		public function get x():Number { return _base.x; }
		public function set x(value:Number):void { _base.x = value; }
		public function get y():Number { return _base.y; }
		public function set y(value:Number):void { _base.y = value; }
		public function get angle():Number { return Math.atan2(y, x); }
		public function get length():Number { return Math.sqrt(x * x + y * y); }
	}
	
}