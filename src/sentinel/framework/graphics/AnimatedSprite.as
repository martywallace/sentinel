package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	
	public class AnimatedSprite extends MovieClip implements IGraphics
	{
		
		public function AnimatedSprite(texture:Vector.<Texture>, fps:int = 12)
		{
			super(textures, fps);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
		}
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}