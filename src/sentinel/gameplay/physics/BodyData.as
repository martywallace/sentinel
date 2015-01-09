package sentinel.gameplay.physics
{
	
	import sentinel.gameplay.world.Being;
	
	
	/**
	 * Used to bind a native b2Body to a Sentinel Body and an owner.
	 * @author Marty Wallace.
	 */
	public class BodyData
	{
		
		private var _body:Body;
		private var _owner:Being;
		
		
		public function BodyData(body:Body, owner:Being)
		{
			_body = body;
			_owner = owner;
		}
		
		
		public function get body():Body { return _body; }
		public function get owner():Being { return _owner; }
		
	}
	
}