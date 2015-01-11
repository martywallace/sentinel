package sentinel.framework.graphics 
{
	
	import sentinel.gameplay.physics.Vector2D;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	
	public class Line extends Quad
	{
		
		public function Line(start:Vector2D, end:Vector2D, thickness:Number = 1, color:uint = 0xFFFFFF, premultipliedAlpha:Boolean = true)
		{
			var vec:Vector2D = end.subtract(start);
			
			super(vec.length, thickness, color, premultipliedAlpha);
			
			alignPivot(HAlign.LEFT, VAlign.CENTER);
			
			x = start.x;
			y = start.y;
			rotation = vec.angle;
		}
		
	}

}