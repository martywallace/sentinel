package sentinel.framework.util
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.IGraphicsContainer;
	import starling.display.DisplayObject;
	
	
	public class GraphicsUtil
	{
		
		public static function sortChildrenByDepth(container:IGraphicsContainer):void
		{
			container.sortChildren(function(a:IGraphics, b:IGraphics):int
			{
				return a.depth === b.depth ? 0 : (a.depth < b.depth ? -1 : 1);
			});
		}
		
	}
	
}