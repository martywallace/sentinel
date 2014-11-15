package sentinel.framework.events
{
	
	import sentinel.framework.Thing;
	import starling.events.Event;
	
	
	public class ThingEvent extends Event
	{
		
		public static const DECONSTRUCTED:String = 'Deconstructed';
		public static const UPDATED:String = 'Updated';
		public static const ADDED:String = 'Added';
		public static const REMOVED:String = 'Removed';
		
		
		public function ThingEvent(type:String)
		{
			super(type);
		}
		
		
		public function get thing():Thing { return target as Thing; }
		
	}
	
}