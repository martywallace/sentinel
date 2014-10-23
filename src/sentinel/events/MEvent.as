package sentinel.events
{
	
	import starling.events.Event;
	import sentinel.user.Mouse;
	
	
	public class MEvent extends Event
	{
		
		public static const LEFT_DOWN:String = 'LeftDown';
		public static const LEFT_UP:String = 'LeftUp';
		public static const RIGHT_DOWN:String = 'RightDown';
		public static const RIGHT_UP:String = 'RightUp';
		
		
		public function MEvent(type:String)
		{
			super(type);
		}
		
		
		public function get mouse():Mouse{ return target as Mouse; }
		
	}
	
}