package sentinel.framework.graphics
{
	
	import sentinel.framework.Game;
	import sentinel.framework.client.Viewport;
	import starling.core.Starling;
	import starling.display.Quad;
	
	
	public class Quad extends starling.display.Quad implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function Quad(width:Number, height:Number, color:uint = 0, premultipliedAlpha:Boolean = true)
		{
			super(width, height, color, premultipliedAlpha);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent();
			dispose();
		}
		
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		public function get depth():int { return _depth; }
		public function set depth(value:int):void { _depth = value; }		
	}
	
}