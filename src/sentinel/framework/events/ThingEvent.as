package sentinel.framework.events
{
	
	import sentinel.framework.Thing;
	
	
	public class ThingEvent extends Event
	{
		
		public static const DECONSTRUCTED:String = 'deconstructed';
		public static const UPDATED:String = 'updated';
		public static const ADDED:String = 'added';
		public static const REMOVED:String = 'removed';
		
		/**
		 * TODO
		 */
		public static const BECAME_PARENT:String = 'becameParent';
		public static const BECAME_ANCESTOR:String = 'becameAncestor';
		
		
		public function ThingEvent(type:String)
		{
			super(type);
		}
		
		
		public function get thing():Thing { return target as Thing; }
		
	}
	
}