package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.display.DisplayObjectContainer;
	import starling.display.Quad;
	
	
	public class Quad extends starling.display.Quad implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function Quad(width:Number, height:Number, color:uint, premultipliedAlpha:Boolean = true)
		{
			super(width, height, color, premultipliedAlpha);
		}
		
		
		public function addTo(target:DisplayObjectContainer):void
		{
			target.addChild(this);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
		}
		
		
		public function get depth():int { return _depth; }
		
		public function set depth(value:int):void
		{
			_depth = value;
			
			if (parent && (parent as IGraphicsContainer).autoSort)
			{
				(parent as IGraphicsContainer).sortChildrenByDepth();
			}
		}
		
		public function get atZero():Boolean { return x === 0 && y === 0 && rotation === 0; }
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}