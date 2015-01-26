package sentinel.framework.events
{
	
	import sentinel.framework.IDeconstructs;
	import starling.events.EventDispatcher;
	
	
	/**
	 * The Sentinel level EventDispatcher.
	 * @author Marty Wallace.
	 */
	public class EventDispatcher extends starling.events.EventDispatcher implements IDeconstructs
	{
		
		/**
		 * Deconstructor.
		 * Removes any event listeners attached to this EventDispatcher.
		 */
		public function deconstruct():void
		{
			removeEventListeners();
		}
		
	}
	
}