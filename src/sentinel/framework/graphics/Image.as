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
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
		}
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}