package sentinel.gameplay.world
{
	
	import sentinel.gameplay.physics.EngineQueryResult;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.gameplay.physics.Vector2D;
	
	
	public class QueryResult
	{
		
		private var _being:Being;
		private var _engineQueryResult:EngineQueryResult;
		
		
		public function QueryResult(being:Being, engineQueryResult:EngineQueryResult = null)
		{
			_being = being;
			_engineQueryResult = engineQueryResult;
		}
		
		
		public function get being():Being { return _being; }
		public function get fixutre():Fixture { return _engineQueryResult === null ? null : _engineQueryResult.fixture; }
		public function get point():Vector2D { return _engineQueryResult === null ? null : _engineQueryResult.point; }
		
	}
	
}