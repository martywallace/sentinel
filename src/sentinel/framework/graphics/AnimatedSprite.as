package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.graphics.Texture;
	import starling.display.DisplayObjectContainer;
	import starling.textures.Texture;
	import starling.display.MovieClip;
	
	
	public class AnimatedSprite extends MovieClip implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function AnimatedSprite(textures:Vector.<sentinel.framework.graphics.Texture>, fps:int = 12)
		{
			var native:Vector.<starling.textures.Texture> = new <starling.textures.Texture>[];
			
			for each(var texture:sentinel.framework.graphics.Texture in textures)
			{
				native.push(texture.__base);
			}
			
			super(native, fps);
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