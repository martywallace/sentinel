package sentinel.b2
{
	
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import sentinel.events.B2ContactEvent;
	
	
	/**
	 * Internal generic collision handler.
	 * 
	 * @author Marty Wallace.
	 */
	internal class B2ContactListener extends b2ContactListener
	{
		
		override public function BeginContact(contact:b2Contact):void
		{
			_manageContact(contact, B2ContactEvent.BEGIN);
		}
		
		
		override public function EndContact(contact:b2Contact):void
		{
			_manageContact(contact, B2ContactEvent.END);
		}
		
		
		private function _manageContact(contact:b2Contact, type:String):void
		{
			var fixtureA:B2Fixture = contact.GetFixtureA().GetUserData() as B2Fixture;
			var fixtureB:B2Fixture = contact.GetFixtureB().GetUserData() as B2Fixture;
			
			var bodyA:B2Body = (contact.GetFixtureA().GetBody().GetUserData() as B2BodyData).body;
			var bodyB:B2Body = (contact.GetFixtureB().GetBody().GetUserData() as B2BodyData).body;
			
			if (bodyA.hasEventListener(B2ContactEvent.BEGIN)) bodyA.dispatchEvent(new B2ContactEvent(type, contact, fixtureA, bodyA, fixtureB, bodyB));
			if (bodyB.hasEventListener(B2ContactEvent.END)) bodyB.dispatchEvent(new B2ContactEvent(type, contact, fixtureB, bodyB, fixtureA, bodyA));
		}
		
	}
	
}