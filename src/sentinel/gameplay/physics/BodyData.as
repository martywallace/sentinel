package sentinel.gameplay.physics
{
	
	import sentinel.framework.Thing;
	
	
	/**
	 * Used to bind a native b2Body to a Sentinel Body and an owner.
	 * @author Marty Wallace.
	 */
	public class BodyData
	{
		
		private var _body:Body;
		private var _owner:Thing;
		
		
		public function BodyData(body:Body, owner:Thing)
		{
			_body = body;
			_owner = owner;
		}
		
		
		public function get body():Body { return _body; }
		public function get owner():Thing { return _owner; }
		
	}
	
}