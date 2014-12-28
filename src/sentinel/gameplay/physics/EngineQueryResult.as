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
		private var _point2:Vector2D;
		
		
		/**
		 * Constructor.
		 * @param fixture The Fixture of interest for this result.
		 * @param point The point of interest for this result. In a <code>queryLine()</code> call,
		 * this will be the point of intersection.
		 * @param point2 A secondary point of interest. In a <code>queryLine()</code> call, this will
		 * be the normal.
		 */
		public function EngineQueryResult(fixture:Fixture = null, point:Vector2D = null, point2:Vector2D = null) 
		{
			_fixture = fixture;
			_point = point;
			_point2 = point2;
		}
		
		
		/**
		 * The Fixture of interest.
		 */
		public function get fixture():Fixture { return _fixture; }
		
		/**
		 * The primary point of interest.
		 */
		public function get point():Vector2D { return _point; }
		
		/**
		 * The secondary point of interest.
		 */
		public function get point2():Vector2D { return _point2; }
		
	}

}