package sentinel.events
{
	
	import sentinel.b2.B2Body;
	import sentinel.b2.B2Contact;
	import sentinel.base.Thing;
	import starling.events.Event;
	
	
	public class B2ContactEvent extends Event
	{
		
		public static const BEGIN:String = 'Begin';
		public static const END:String = 'End';
		
		
		public function B2ContactEvent(contact:B2Contact)
		{
			super(contact.type);
		}
		
		
		public function get contact():B2Contact
		{
			// TODO.
			return new B2Contact();
		}
		
	}
	
}