package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	
	public class AnimatedSprite extends MovieClip implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function AnimatedSprite(textures:Vector.<Texture>, fps:int = 12)
		{
			super(textures, fps);
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