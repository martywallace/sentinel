package sentinel.framework.events 
{
	
	import starling.events.Event;
	
	
	/**
	 * Sentinel Event class.
	 * @author Marty Wallace.
	 */
	public class Event extends starling.events.Event
	{
		
		/**
		 * Constructor.
		 * @param type The event type.
		 * @param data Arbitrary event data.
		 */
		public function Event(type:String, data:Object = null) 
		{
			super(type, false, data);
		}
		
	}

}