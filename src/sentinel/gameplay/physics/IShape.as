package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2Shape;
	
	
	internal interface IShape
	{
		
		function get base():b2Shape;
		
	}
	
}