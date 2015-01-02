package sentinel.gameplay.events
{
	
	import sentinel.framework.events.Event;
	import sentinel.gameplay.world.BaseWorld;
	
	
	public class WorldEvent extends Event
	{
		
		public static const FREEZE:String = 'freeze';
		public static const UNFREEZE:String = 'unfreeze';
		
		
		public function WorldEvent(type:String)
		{
			super(type);
		}
		
		
		public function get world():BaseWorld { return target as BaseWorld; }
		
	}
	
}