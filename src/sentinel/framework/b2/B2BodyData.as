package sentinel.framework.b2
{
	
	import sentinel.framework.Thing;
	
	
	/**
	 * Used to bind a native b2Body to a Sentinel B2Body and an owner.
	 * @author Marty Wallace.
	 */
	public class B2BodyData
	{
		
		private var _body:B2Body;
		private var _owner:Thing;
		
		
		public function B2BodyData(body:B2Body, owner:Thing)
		{
			_body = body;
			_owner = owner;
		}
		
		
		public function get body():B2Body { return _body; }
		public function get owner():Thing { return _owner; }
		
	}
	
}