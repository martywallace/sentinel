package sentinel.gameplay.world
{	
	
	import sentinel.framework.events.EventDispatcher;
	
	
	/**
	 * Provides a service to be used by the World, e.g. an enemy spawner, pickup generator, etc.
	 * @author Marty Wallace.
	 */
	public class WorldService extends EventDispatcher
	{
		
		private var _world:BaseWorld;
		
		
		public override function deconstruct():void
		{
			// ..?
			
			super.deconstruct();
		}
		
		
		internal function __construct(world:BaseWorld):void
		{
			_world = world;
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
		
		
		protected function get world():BaseWorld { return _world; }
		
		
		public function get name():String { return null; }
		
	}
	
}