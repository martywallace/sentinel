package sentinel.framework.util 
{
	
	import sentinel.framework.graphics.IGraphics;
	
	
	public class GraphicsUtil
	{
		
		public static function sortCompareFunction(a:IGraphics, b:IGraphics):int
		{
			return a.depth === b.depth ? 0 : (a.depth < b.depth ? -1 : 1);
		}
		
	}

}