package sentinel.framework.events
{
	
	import Box2D.Dynamics.Contacts.b2Contact;
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2Fixture;
	import starling.events.Event;
	
	
	/**
	 * An event holding contact data between two B2Bodies.
	 * @author Marty Wallace.
	 */
	public class B2ContactEvent extends Event
	{
		
		public static const BEGIN:String = 'begin';
		public static const END:String = 'end';
		
		
		private var _base:b2Contact;
		private var _localFixture:B2Fixture;
		private var _localBody:B2Body;
		private var _externalFixture:B2Fixture;
		private var _externalBody:B2Body;
		
		
		/**
		 * Constructor.
		 * @param type The contact type. Can be <code>B2ContactEvent.BEGIN</code> or <code>B2ContactEvent.END</code>.
		 * @param base The internal <code>Box2D.Dynamics.Contacts.b2Contact</code> instance.
		 * @param localFixture The fixture associated with the listening body.
		 * @param localBody The body listening for contact with another.
		 * @param externalFixture The fixture who the listening body came into contact with.
		 * @param externalBody The body who the listening body came into contact with.
		 */
		public function B2ContactEvent(type:String, base:b2Contact, localFixture:B2Fixture, localBody:B2Body, externalFixture:B2Fixture, externalBody:B2Body)
		{
			_base = base;
			
			_localFixture = localFixture;
			_localBody = localBody;
			_externalFixture = externalFixture;
			_externalBody = externalBody;
			
			super(type);
		}
		
		
		/**
		 * The fixture associated with the body listening for a contact event.
		 */
		public function get localFixture():B2Fixture { return _localFixture; }
		
		/**
		 * The body listening for a contact event.
		 */
		public function get localBody():B2Body { return _localBody; }
		
		/**
		 * The fixture associated with the body coming into contact with the listening body.
		 */
		public function get externalFixture():B2Fixture { return _externalFixture; }
		
		/**
		 * The body coming into contact with the listening body.
		 */
		public function get externalBody():B2Body { return _externalBody; }
		
	}
	
}