package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.display.Image;
	
	
	public class Image extends starling.display.Image implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function Image(texture:Texture)
		{
			super(texture.__base);
		}
		
		
		// TODO: Surely there's simply a texture replacement in Starling?
		public function replace(image:sentinel.framework.graphics.Image):sentinel.framework.graphics.Image
		{
			if(parent !== null)
			{
				parent.addChild(image);
				image.x = x;
				image.y = y;
				image.rotation = rotation;
			}
			
			deconstruct();
			
			return image;
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