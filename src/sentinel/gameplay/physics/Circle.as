package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class Circle extends Shape
	{
		
		private var _radius:Number;
		
		
		public function Circle(radius:Number)
		{
			_radius = radius;
			
			super();
		}
		
		
		protected override function defineBase():b2Shape
		{
			return new b2CircleShape(_radius / Engine.scale);
		}
		
	}
	
}