package sentinel.gameplay.physics
{
	
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import sentinel.gameplay.events.ContactEvent;
	
	
	/**
	 * Internal generic collision handler.
	 * 
	 * @author Marty Wallace.
	 */
	internal class ContactListener extends b2ContactListener
	{
		
		override public function BeginContact(contact:b2Contact):void
		{
			_manageContact(contact, ContactEvent.BEGIN);
		}
		
		
		override public function EndContact(contact:b2Contact):void
		{
			_manageContact(contact, ContactEvent.END);
		}
		
		
		private function _manageContact(contact:b2Contact, type:String):void
		{
			var fixtureA:Fixture = contact.GetFixtureA().GetUserData() as Fixture;
			var fixtureB:Fixture = contact.GetFixtureB().GetUserData() as Fixture;
			
			var bodyA:Body = fixtureA.body;
			var bodyB:Body = fixtureB.body;
			
			if (bodyA.hasEventListener(type)) bodyA.dispatchEvent(new ContactEvent(type, contact, fixtureA, bodyA, fixtureB, bodyB));
			if (bodyB.hasEventListener(type)) bodyB.dispatchEvent(new ContactEvent(type, contact, fixtureB, bodyB, fixtureA, bodyA));
		}
		
	}
	
}