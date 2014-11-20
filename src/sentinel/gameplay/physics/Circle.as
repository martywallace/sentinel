package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class Circle implements IShape
	{
		
		private var _base:b2CircleShape;
		
		
		public function Circle(radius:Number)
		{
			_base = new b2CircleShape(radius / Engine.scale);
		}
		
		
		public function get base():b2Shape{ return _base; }
		
	}
	
}