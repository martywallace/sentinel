package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.display.Image;
	import starling.textures.Texture;
	
	
	public class Image extends starling.display.Image implements IGraphics
	{
		
		public function Image(texture:Texture)
		{
			super(texture);
		}
		
		
		// TODO: Surely there's simply a texture replacement in Starling?
		public function replace(image:sentinel.framework.graphics.Image):sentinel.framework.graphics.Image
		{
			if(parent !== null)
			{
				parent.addChild(image)
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
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}