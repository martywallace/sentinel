package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import starling.display.Image;
	import starling.core.Starling;
	import sentinel.framework.Game;
	import sentinel.framework.Library;
	
	
	public class Image extends starling.display.Image implements IGraphics
	{
		
		private var _depth:int = 0;
		
		
		public function Image(textureName:String)
		{
			super(library.getTexture(textureName));
		}
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
			removeEventListeners();
		}
		
		
		public function get depth():int { return _depth; }
		public function set depth(value:int):void { _depth = value; }
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		public function get library():Library { return (Starling.current.root as Game).library; }
		
	}
	
	
}