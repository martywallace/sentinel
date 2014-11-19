package
{
	
	import flash.geom.Point;
	
	
	public class Team
	{
		
		private var _color:uint;
		private var _position:Point;
		
		
		public function Team(color:uint, position:Point)
		{
			_color = color;
			_position = position;
		}
		
		
		public function get color():uint{ return _color; }
		public function get position():Point{ return _position; }
		
	}
	
}