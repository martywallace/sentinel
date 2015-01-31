package sentinel.gameplay.world
{
	
	import sentinel.framework.Service;
	
	
	/**
	 * Provides a service to be used by a Being, e.g. an inventory, AI module, etc.
	 * @author Marty Wallace.
	 */
	public class BeingService extends Service
	{
		
		/**
		 * A reference to the Being being serviced by this BeingService.
		 */
		protected function get being():Being { return serviceable as Being; }
		
	}
	
}