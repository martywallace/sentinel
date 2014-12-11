package sentinel.framework.events
{
	
	import sentinel.framework.client.Mouse;
	
	
	public class MouseEvent extends Event
	{
		
		public static const LEFT_DOWN:String = 'leftDown';
		public static const LEFT_UP:String = 'leftUp';
		public static const RIGHT_DOWN:String = 'rightDown';
		public static const RIGHT_UP:String = 'rightUp';
		
		
		public function MouseEvent(type:String)
		{
			super(type);
		}
		
		
		public function get mouse():Mouse{ return target as Mouse; }
		
	}
	
}