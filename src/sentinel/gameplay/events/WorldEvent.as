package sentinel.gameplay.events
{
	
	import sentinel.gameplay.scene.World;
	import starling.events.Event;
	
	
	public class WorldEvent extends Event
	{
		
		public static const FREEZE:String = 'freeze';
		public static const UNFREEZE:String = 'unfreeze';
		
		
		public function WorldEvent(type:String)
		{
			super(type);
		}
		
		
		public function get world():World { return target as World; }
		
	}
	
}