package sentinel.gameplay.events
{
	
	import sentinel.framework.events.Event;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.Region;
	
	
	public class RegionEvent extends Event
	{
		
		public static const ENTER:String = 'enter';
		public static const EXIT:String = 'exit';
		
		
		public function RegionEvent(type:String, being:Being)
		{
			super(type, {
				being: being
			});
		}
		
		
		public function get region():Region { return target as Region; }
		public function get being():Being { return data.being; }
		
	}
	
}