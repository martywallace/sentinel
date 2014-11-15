package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.Game;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	
	public class Sprite extends starling.display.Sprite implements IGraphics
	{
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			if (child === null)
			{
				// Ignore this call.
				return null;
			}
			
			return super.addChild(child);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent();
			removeEventListeners();
		}
		
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		
	}
	
}