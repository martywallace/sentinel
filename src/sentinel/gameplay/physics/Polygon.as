package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class Polygon implements IShape
	{
		
		private var _base:b2PolygonShape;
		private var _verticies:Vector.<Vector2D>;
		
		
		public function Polygon(verticies:Vector.<Vector2D>)
		{
			var nativeVerticies:Array = [];
			
			for each(var i:Vector2D in verticies)
			{
				nativeVerticies.push(i.base);
			}
			
			_base = new b2PolygonShape();
			_base.SetAsArray(nativeVerticies);
			_verticies = verticies.slice();
		}
		
		
		public function get base():b2Shape{ return _base; }
		public function get verticies():Vector.<Vector2D>{ return _verticies; }
		
	}
	
}