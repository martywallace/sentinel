package sentinel.gameplay.physics 
{
	
	/**
	 * Result data obtained from using a query method on a physics Engine instance.
	 * @author Marty Wallace.
	 */
	public class EngineQueryResult 
	{
		
		private var _fixture:Fixture;
		private var _point:Vector2D;
		
		
		public function EngineQueryResult(fixture:Fixture, point:Vector2D = null) 
		{
			_fixture = fixture;
			_point = point;
		}
		
		
		public function get fixture():Fixture { return _fixture; }
		public function get point():Vector2D { return _point; }
		
	}

}