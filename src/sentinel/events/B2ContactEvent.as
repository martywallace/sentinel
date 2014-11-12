package sentinel.events
{
	
	import Box2D.Dynamics.Contacts.b2Contact;
	import sentinel.b2.B2Body;
	import sentinel.b2.B2BodyData;
	import sentinel.b2.B2Fixture;
	import starling.events.Event;
	
	
	public class B2ContactEvent extends Event
	{
		
		public static const BEGIN:String = 'Begin';
		public static const END:String = 'End';
		
		
		private var _base:b2Contact;
		private var _localFixture:B2Fixture;
		private var _localBody:B2Body;
		private var _externalFixture:B2Fixture;
		private var _externalBody:B2Body;
		
		
		public function B2ContactEvent(type:String, base:b2Contact, localFixture:B2Fixture, localBody:B2Body, externalFixture:B2Fixture, externalBody:B2Body)
		{
			_base = base;
			
			_localFixture = localFixture;
			_localBody = localBody;
			_externalFixture = externalFixture;
			_externalBody = externalBody;
			
			super(type);
		}
		
		
		public function get localFixture():B2Fixture { return _localFixture; }
		public function get localBody():B2Body { return _localBody; }
		public function get externalFixture():B2Fixture { return _externalFixture; }
		public function get externalBody():B2Body { return _externalBody; }
		
	}
	
}