package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class Polygon extends Shape
	{
		
		private var _verticies:Vector.<Vector2D>;
		
		
		public function Polygon(verticies:Vector.<Vector2D>)
		{
			_verticies = verticies.slice();
			super();
		}
		
		
		protected override function defineBase():b2Shape
		{
			var nativeVerticies:Array = [];
			
			for each(var vertex:Vector2D in _verticies)
			{
				nativeVerticies.push(vertex.__base);
			}
			
			var base:b2PolygonShape = new b2PolygonShape();
			base.SetAsArray(nativeVerticies);
			
			return base;
		}
		
		
		public function get verticies():Vector.<Vector2D>{ return _verticies; }
		
	}
	
}