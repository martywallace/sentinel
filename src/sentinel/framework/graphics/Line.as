package sentinel.framework.graphics 
{
	
	import flash.geom.Point;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	
	public class Line extends Quad
	{
		
		public function Line(start:Point, end:Point, thickness:Number = 1, color:uint = 0xFFFFFF, premultipliedAlpha:Boolean = true)
		{
			var length:Number = end.subtract(start);
			
			super(length, thickness, color, premultipliedAlpha);
			
			alignPivot(HAlign.LEFT, VAlign.CENTER);
			
			x = start.x;
			y = start.y;
			rotation = Math.atan2(end.y - y, end.x - x);
		}
		
	}

}