package sentinel.geom
{
	
	public class Vector2D
	{
		
		private var _x:Number;
		private var _y:Number;
		
		
		public function Vector2D(x:Number, y:Number)
		{
			_x = x;
			_y = y;
		}
		
		
		public function get x():Number { return _x; }
		public function set x(value:Number):void { _x = x; }
		public function get y():Number { return _y; }
		public function set y(value:Number):void { _y = y; }
		
	}
	
}