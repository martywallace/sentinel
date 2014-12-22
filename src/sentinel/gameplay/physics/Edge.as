package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class Edge implements IShape
	{
		
		private var _base:b2PolygonShape;
		
		
		public function Edge(start:Vector2D, end:Vector2D)
		{
			_base = new b2PolygonShape();
			_base.SetAsEdge(start.base, end.base);
		}
		
		
		public function get base():b2Shape{ return _base; }
		
	}
	
}