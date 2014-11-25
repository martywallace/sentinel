package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2Shape;
	
	
	/**
	 * Defines a shape used by a Fixture.
	 * @author Marty Wallace.
	 */
	public interface IShape
	{
		
		function get base():b2Shape;
		
	}
	
}