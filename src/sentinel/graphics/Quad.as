package sentinel.graphics
{
	
	import starling.display.Quad;
	
	
	public class Quad extends starling.display.Quad implements IGraphics
	{
		
		public function Quad(width:Number, height:Number, color:uint = 0, premultipliedAlpha:Boolean = true)
		{
			super(width, height, color, premultipliedAlpha);
		}
		
	}
	
}