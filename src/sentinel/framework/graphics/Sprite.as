package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.Game;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import sentinel.framework.util.GraphicsUtil;
	
	
	public class Sprite extends starling.display.Sprite implements IGraphics, IGraphicsContainer
	{
		
		private var _depth:int = 0;
		
		
		public function deconstruct():void
		{
			removeFromParent();
			dispose();
		}
		
		
		public function sortChildrenByDepth():void
		{
			sortChildren(GraphicsUtil.sortCompareFunction);
		}
		
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			if (child === null)
			{
				// Ignore this call.
				return null;
			}
			
			return super.addChild(child);
		}
		
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		public function get depth():int { return _depth; }
		public function set depth(value:int):void { _depth = value; }
		
	}
	
}