package sentinel.framework.events
{
	
	import sentinel.framework.Thing;
	import starling.events.Event;
	
	
	public class ThingEvent extends Event
	{
		
		public static const DECONSTRUCTED:String = 'deconstructed';
		public static const UPDATED:String = 'updated';
		public static const ADDED:String = 'added';
		public static const REMOVED:String = 'removed';
		
		
		public function ThingEvent(type:String)
		{
			super(type);
		}
		
		
		public function get thing():Thing { return target as Thing; }
		
	}
	
}