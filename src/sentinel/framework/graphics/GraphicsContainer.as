package sentinel.framework.graphics
{
	
	public class GraphicsContainer extends Graphics
	{
		
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