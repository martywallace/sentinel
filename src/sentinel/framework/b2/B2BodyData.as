package sentinel.framework.b2
{
	
	import sentinel.framework.Thing;
	
	
	/**
	 * Used to bind a native b2Body to a Sentinel B2Body.
	 * @author Marty Wallace.
	 */
	public class B2BodyData
	{
		
		private var _body:B2Body;
		private var _owner:Thing;
		
		
		public function B2BodyData(body:B2Body)
		{
			_body = body;
		}
		
		
		public function get body():B2Body { return _body; }
		
		
		internal function get owner():Thing { return _owner; }
		internal function set owner(value:Thing):void { _owner = value; }
		
	}
	
}