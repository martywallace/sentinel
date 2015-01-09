package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.client.Viewport;
	import starling.display.DisplayObject;
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
		
		
		public function addTo(container:IGraphicsContainer):void
		{
			container.addChild(this as DisplayObject);
		}
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
		public function get depth():int { return _depth; }
		public function set depth(value:int):void { _depth = value; }
		
		public function get atZero():Boolean { return x === 0 && y === 0 && rotation === 0; }		
	}
	
}