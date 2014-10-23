package sentinel.events
{
	
	import sentinel.base.Thing;
	import starling.events.Event;
	
	
	public class ThingEvent extends Event
	{
		
		public static const CONSTRUCTED:String = 'Constructed';
		public static const DECONSTRUCTED:String = 'Deconstructed';
		public static const UPDATED:String = 'Updated';
		
		
		public function ThingEvent(type:String)
		{
			super(type);
		}
		
		
		public function get thing():Thing { return target as Thing; }
		
	}
	
}