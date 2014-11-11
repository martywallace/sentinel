package sentinel.b2
{
	
	/**
	 * Represents contact between two B2Fixtures.
	 * 
	 * @author Marty Wallace.
	 */
	public class B2Contact
	{
		
		private var _type:String;
		private var _fixtureA:B2Fixture;
		private var _fixtureB:B2Fixture;
		
		
		public function B2Contact(type:String, fixtureA:B2Fixture, fixtureB:B2Fixture)
		{
			_type = type;
			_fixtureA = fixtureA;
			_fixtureB = fixtureB;
		}
		
		
		public function get type():String { return _type; }
		public function get fixtureA():B2Fixture { return _fixtureA; }
		public function get fixtureB():B2Fixture { return _fixtureB; }
		
	}
	
}