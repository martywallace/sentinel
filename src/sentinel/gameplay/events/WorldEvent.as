package sentinel.gameplay.events
{
	
	import sentinel.framework.events.Event;
	import sentinel.gameplay.world.BaseWorld;
	import sentinel.gameplay.world.Being;
	
	
	public class WorldEvent extends Event
	{
		
		public static const FREEZE:String = 'freeze';
		public static const UNFREEZE:String = 'unfreeze';
		public static const BEING_ADDED:String = 'beingAdded';
		public static const BEING_REMOVED:String = 'beingRemoved';
		
		
		public function WorldEvent(type:String, being:Being = null)
		{
			super(type, {
				being: being
			});
		}
		
		
		public function get world():BaseWorld { return target as BaseWorld; }
		public function get being():Being { return data.being; }
		
	}
	
}