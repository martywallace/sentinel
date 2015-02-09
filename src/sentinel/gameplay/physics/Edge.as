package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class Edge extends Shape
	{
		
		private var _start:Vector2D;
		private var _end:Vector2D;
		private var _vertices:Vector.<Vector2D>;
		
		
		public function Edge(start:Vector2D, end:Vector2D)
		{
			_start = start;
			_end = end;
			
			super();
		}
		
		
		protected override function defineBase():b2Shape
		{
			var base:b2PolygonShape = new b2PolygonShape();
			base.SetAsEdge(_start.__base, _end.__base);
			
			return base;
		}
		
		
		public function get start():Vector2D { return _start; }
		public function get end():Vector2D { return _end; }
		
		
		public override function get vertices():Vector.<Vector2D>
		{
			if(_vertices === null)
			{
				_vertices = new <Vector2D>[_start, _end];
			}
			
			return _vertices;
		}
		
	}
	
}