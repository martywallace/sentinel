package sentinel.gameplay.world
{	
	
	import starling.events.EventDispatcher;
	
	
	/**
	 * Provides a service to be used by the World, e.g. an enemy spawner, pickup generator, etc.
	 * @author Marty Wallace.
	 */
	public class WorldService extends EventDispatcher
	{
		
		private var _world:World;
		
		
		public function WorldService(world:World)
		{
			_world = world;
		}
		
		
		internal function __construct():void
		{
			construct();
		}
		
		
		protected function construct():void
		{
			//
		}
		
		
		internal function __update():void
		{
			update();
		}
		
		
		protected function update():void
		{
			//
		}
		
		
		protected function get world():World { return _world; }
		
		
		public function get name():String { return null; }
		
	}
	
}