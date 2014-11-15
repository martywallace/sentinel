package sentinel.framework.graphics
{
	
	import sentinel.framework.Game;
	import sentinel.framework.client.Viewport;
	import starling.core.Starling;
	import starling.display.Quad;
	
	
	public class Quad extends starling.display.Quad implements IGraphics
	{
		
		public function Quad(width:Number, height:Number, color:uint = 0, premultipliedAlpha:Boolean = true)
		{
			super(width, height, color, premultipliedAlpha);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
			removeEventListeners();
		}
		
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		
	}
	
}