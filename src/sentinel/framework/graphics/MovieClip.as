package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.graphics.Viewport;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	
	public class MovieClip extends starling.display.MovieClip implements IGraphics
	{
		
		private var _extender:Extender;
		
		
		public function MovieClip(textures:Vector.<Texture>, fps:int = 1)
		{
			_extender = new Extender(this);
			super(textures, fps);
		}
		
		
		public function deconstruct():void
		{
			_extender.deconstruct();
		}
		
		
		public function get viewport():Viewport { return _extender.__viewport; }
		
		public function get depth():int { return _extender.__depth; }
		public function set depth(value:int):void { _extender.__depth = value; }
		
		public function get atZero():Boolean { return _extender.__atZero; }
		
	}
	
}