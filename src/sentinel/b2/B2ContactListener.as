package sentinel.b2
{
	
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import sentinel.events.B2Event;
	
	
	/**
	 * Internal generic collision handler.
	 * 
	 * @author Marty Wallace.
	 */
	internal class B2ContactListener extends b2ContactListener
	{
		
		override public function BeginContact(contact:b2Contact):void
		{
			_manageContact(contact, B2Event.BEGIN_CONTACT);
		}
		
		
		override public function EndContact(contact:b2Contact):void
		{
			_manageContact(contact, B2Event.END_CONTACT);
		}
		
		
		private function _manageContact(contact:b2Contact, type:int):void
		{
			var fixtureA:B2Fixture = contact.GetFixtureA().GetUserData() as B2Fixture;
			var fixtureB:B2Fixture = contact.GetFixtureB().GetUserData() as B2Fixture;
			var bodyA:b2Body = contact.GetFixtureA().GetBody();
			var bodyB:b2Body = contact.GetFixtureB().GetBody();
			
			if(beingA && beingB)
			{
				if(beingA.trackContact && beingB.trackContact)
				{
					var contactA:Contact = new Contact(beingB, fixtureA, fixtureB, type);
					var contactB:Contact = new Contact(beingA, fixtureB, fixtureA, type);
					
					beingA.manageContact(contactA);
					beingB.manageContact(contactB);
				}
			}
		}
		
	}
	
}