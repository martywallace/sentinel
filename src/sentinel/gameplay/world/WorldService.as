package sentinel.gameplay.world
{	
	
	import sentinel.framework.Service;
	
	
	/**
	 * Provides a service to be used by the World, e.g. an enemy spawner, pickup generator, etc.
	 * @author Marty Wallace.
	 */
	public class WorldService extends Service
	{
		
		/**
		 * A reference to the world being serviced by this WorldService.
		 */
		protected function get world():BaseWorld { return serviceable as BaseWorld; }
		
	}
	
}