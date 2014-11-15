package sentinel.framework.b2
{
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class B2Circle implements IB2Shape
	{
		
		private var _base:b2CircleShape;
		
		
		public function B2Circle(radius:Number)
		{
			_base = new b2CircleShape(radius / B2World.scale);
		}
		
		
		public function get base():b2Shape{ return _base; }
		
	}
	
}