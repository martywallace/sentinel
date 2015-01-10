package sentinel.framework.graphics
{
	
	import starling.display.DisplayObject;
	
	
	internal class GraphicsContainer extends Graphics
	{
		
		private var _autoSort:Boolean;
		
		
		public function GraphicsContainer(base:DisplayObject, autoSort:Boolean = false)
		{
			_autoSort = autoSort;
			super(base);
		}
		
		
		public function addChild(graphics:Graphics):Graphics
		{
			//
		}
		
		
		public function removeChild(graphics:Graphics):Graphics
		{
			//
		}
		
		
		public function sortChildrenByDepth():void
		{
			sortChildren(function(a:Graphics, b:Graphics):int
			{
				return a.depth === b.depth ? 0 : (a.depth < b.depth ? -1 : 1);
			});
		}
		
	}
	
}