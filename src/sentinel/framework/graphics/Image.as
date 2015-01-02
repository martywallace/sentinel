package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.BaseGame;
	import sentinel.framework.Library;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.textures.Texture;
	
	
	public class Image extends starling.display.Image implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function Image(texture:Texture)
		{
			super(texture);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent();
			dispose();
		}
		
		
		public function get depth():int { return _depth; }
		public function set depth(value:int):void { _depth = value; }
		
		public function get viewport():Viewport { return (Starling.current.root as BaseGame).viewport; }
		public function get library():Library { return (Starling.current.root as BaseGame).library; }
		public function get atZero():Boolean { return x === 0 && y === 0 && rotation === 0; }
		
	}
	
	
}