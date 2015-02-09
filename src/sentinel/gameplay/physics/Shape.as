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
		internal function get __base():b2Shape { return _base; }
		
		/**
		 * Returns a list of vertices used to define this Shape.
		 * This method returns null if the shape is a type with no vertices (e.g. a Circle).
		 */
		public function get vertices():Vector.<Vector2D> { return null; }
		
	}
	
}