package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.client.Viewport;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	
	public class MovieClip extends starling.display.MovieClip implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function MovieClip(textures:Vector.<Texture>, fps:int = 1)
		{
			super(textures, fps);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent();
			dispose();
		}
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
		public function get depth():int{ return _depth; }
		public function set depth(value:int):void { _depth = value; }
		
		public function get atZero():Boolean { return x === 0 && y === 0 && rotation === 0; }
		
	}
	
}