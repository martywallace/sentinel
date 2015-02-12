package sentinel.framework.graphics
{
	
	import flash.geom.Point;
	
	
	public class Line extends Quad
	{
		
		public function Line(start:Point, end:Point, thickness:Number = 3, color:uint = 0xFFFFFF, premultipliedAlpha:Boolean = true)
		{
			var line:Point = end.subtract(start);
			
			super(line.length, thickness, color, premultipliedAlpha);
			
			x = start.x;
			y = start.y;
			rotation = Math.atan2(end.y - start.y, end.x - start.x);
		}
		
	}
	
}