package sentinel.framework
{
	
	import sentinel.framework.client.Mouse;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.gameplay.physics.Vector2D;
	
	
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