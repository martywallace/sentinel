package sentinel.framework.events
{
	
	import sentinel.framework.client.Mouse;
	import starling.events.Event;
	
	
	public class MouseEvent extends Event
	{
		
		public static const LEFT_DOWN:String = 'LeftDown';
		public static const LEFT_UP:String = 'LeftUp';
		public static const RIGHT_DOWN:String = 'RightDown';
		public static const RIGHT_UP:String = 'RightUp';
		
		
		public function MouseEvent(type:String)
		{
			super(type);
		}
		
		
		public function get mouse():Mouse{ return target as Mouse; }
		
	}
	
}