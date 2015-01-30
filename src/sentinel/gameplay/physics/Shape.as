package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2Shape;
	
	
	/**
	 * Defines a shape used by a Fixture.
	 * @author Marty Wallace.
	 */
	public class Shape
	{
		
		private var _base:b2Shape;
		
		
		public function Shape()
		{
			_base = defineBase();
		}
		
		
		protected function defineBase():b2Shape
		{
			return null;
		}
		
		
		/**
		 * @private
		 */
		internal function get __base():b2Shape{ return _base; }
		
	}
	
}