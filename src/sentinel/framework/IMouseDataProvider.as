package sentinel.framework
{
	
	import sentinel.framework.graphics.IGraphics;
	
	
	/**
	 * An object that is able to provide data based on the state of the user's mouse.
	 * @author Marty Wallace.
	 */
	public interface IMouseDataProvider
	{
		
		/**
		 * Returns the graphics object used as the 'container' for the mouse.
		 */
		function get mouseContainer():IGraphics;
		
	}
	
}