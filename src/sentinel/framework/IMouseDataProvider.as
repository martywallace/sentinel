package sentinel.framework
{
	import starling.display.DisplayObject;
	
	/**
	 * An object that is able to provide data based on the state of the user's mouse.
	 * 
	 * @author Marty Wallace
	 */
	public interface IMouseDataProvider {
		
		/** The graphics object used as the 'container' for the mouse. */
		function get mouseContainer():DisplayObject;
		
	}
	
}