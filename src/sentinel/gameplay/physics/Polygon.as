package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class Polygon extends Shape
	{
		
		private var _vertices:Vector.<Vector2D>;
		
		
		public function Polygon(verticies:Vector.<Vector2D>)
		{
			_vertices = verticies.slice();
			super();
		}
		
		
		protected override function defineBase():b2Shape
		{
			var nativeVertices:Array = [];
			
			for each(var vertex:Vector2D in _vertices)
			{
				nativeVertices.push(vertex.__base);
			}
			
			var base:b2PolygonShape = new b2PolygonShape();
			base.SetAsArray(nativeVertices);
			
			return base;
		}
		
		
		public override function get vertices():Vector.<Vector2D>{ return _vertices; }
		
	}
	
}