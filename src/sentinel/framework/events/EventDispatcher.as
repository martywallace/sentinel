package sentinel.framework.events
{
	
	import sentinel.framework.IDeconstructs;
	import starling.events.EventDispatcher;
	
	
	public class EventDispatcher extends starling.events.EventDispatcher implements IDeconstructs
	{
		
		public function deconstruct():void
		{
			removeEventListeners();
		}
		
	}
	
}