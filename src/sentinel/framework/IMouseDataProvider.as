package sentinel.framework
{
	
	import sentinel.framework.client.Mouse;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * An object that is able to provide data based on the state of the user's mouse.
	 * @author Marty Wallace.
	 */
	public interface IMouseDataProvider
	{
		
		/**
		 * Returns the position of the mouse relative to this object.
		 * @param mouse A reference to the Mouse component.
		 */
		function getMousePosition(mouse:Mouse):Vector2D;
		
	}
	
}