package sentinel.gameplay.events
{
	
	import Box2D.Dynamics.Contacts.b2Contact;
	import sentinel.framework.events.Event;
	import sentinel.framework.Thing;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Fixture;
	
	
	/**
	 * An event holding contact data between two Bodies.
	 * @author Marty Wallace.
	 */
	public class ContactEvent extends Event
	{
		
		public static const BEGIN:String = 'begin';
		public static const END:String = 'end';
		
		
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
			super(type, {
				base: base,
				localFixture: localFixture,
				localBody: localBody,
				externalFixture: externalFixture,
				externalBody: externalBody
			});
		}
		
		
		/**
		 * The fixture associated with the body listening for a contact event.
		 */
		public function get localFixture():Fixture { return data.localFixture; }
		
		/**
		 * The body listening for a contact event.
		 */
		public function get localBody():Body { return data.localBody; }
		
		/**
		 * The Thing that owns the body listening for a contact event.
		 */
		public function get localOwner():Thing { return data.localBody.owner; }
		
		/**
		 * The fixture associated with the body coming into contact with the listening body.
		 */
		public function get externalFixture():Fixture { return data.externalFixture; }
		
		/**
		 * The body coming into contact with the listening body.
		 */
		public function get externalBody():Body { return data.externalBody; }
		
		/**
		 * The Thing that owns the body coming into contact with the listening body.
		 */
		public function get externalOwner():Thing { return data.externalBody.owner; }
		
	}
	
}