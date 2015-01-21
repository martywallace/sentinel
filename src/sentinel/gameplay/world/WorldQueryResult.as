package sentinel.gameplay.world
{
	
	import sentinel.gameplay.physics.EngineQueryResult;
	
	
	/**
	 * A single result within the list of results provided when querying the World, wrapping a
	 * <code>Being</code> and the physics level <code>EngineQueryResult</code>.
	 * @author Marty Wallace.
	 */
	public class WorldQueryResult extends EngineQueryResult
	{
		
		private var _query:Query;
		private var _being:Being;
		private var _engineQueryResult:EngineQueryResult;
		
		
		public function WorldQueryResult(query:Query, being:Being, engineQueryResult:EngineQueryResult = null)
		{
			_query = query;
			_being = being;
			_engineQueryResult = engineQueryResult;
			
			if(engineQueryResult !== null)
			{
				super(engineQueryResult.fixture, engineQueryResult.point, engineQueryResult.point2);
			}
		}
		
		
		/**
		 * A reference to the Query that provided this result.
		 */
		public function get query():Query { return _query; }
		
		/**
		 * The Being stored within this result.
		 */
		public function get being():Being { return _being; }
		
	}
	
}