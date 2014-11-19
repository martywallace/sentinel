package sentinel.gameplay.events
{
	
	import Box2D.Dynamics.Contacts.b2Contact;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.framework.Thing;
	import starling.events.Event;
	
	
	/**
	 * An event holding contact data between two B2Bodies.
	 * @author Marty Wallace.
	 */
	public class ContactEvent extends Event
	{
		
		public static const BEGIN:String = 'begin';
		public static const END:String = 'end';
		
		
		private var _base:b2Contact;
		private var _localFixture:Fixture;
		private var _localBody:Body;
		private var _externalFixture:Fixture;
		private var _externalBody:Body;
		
		
		/**
		 * Constructor.
		 * @param type The contact type. Can be <code>B2ContactEvent.BEGIN</code> or <code>B2ContactEvent.END</code>.
		 * @param base The internal <code>Box2D.Dynamics.Contacts.b2Contact</code> instance.
		 * @param localFixture The fixture associated with the listening body.
		 * @param localBody The body listening for contact with another.
		 * @param externalFixture The fixture who the listening body came into contact with.
		 * @param externalBody The body who the listening body came into contact with.
		 */
		public function ContactEvent(type:String, base:b2Contact, localFixture:Fixture, localBody:Body, externalFixture:Fixture, externalBody:Body)
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
		public function get localFixture():Fixture { return _localFixture; }
		
		/**
		 * The body listening for a contact event.
		 */
		public function get localBody():Body { return _localBody; }
		
		/**
		 * The Thing that owns the body listening for a contact event.
		 */
		public function get localOwner():Thing { return _localBody.owner; }
		
		/**
		 * The fixture associated with the body coming into contact with the listening body.
		 */
		public function get externalFixture():Fixture { return _externalFixture; }
		
		/**
		 * The body coming into contact with the listening body.
		 */
		public function get externalBody():Body { return _externalBody; }
		
		/**
		 * The Thing that owns the body coming into contact with the listening body.
		 */
		public function get externalOwner():Thing { return _externalBody.owner; }
		
	}
	
}