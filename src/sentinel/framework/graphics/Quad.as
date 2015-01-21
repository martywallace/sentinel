package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.display.Quad;
	
	
	public class Quad extends starling.display.Quad implements IGraphics
	{
		
		public function Quad(width:Number, height:Number, color:uint, premultipliedAlpha:Boolean = true)
		{
			super(width, height, color, premultipliedAlpha);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
		}
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}