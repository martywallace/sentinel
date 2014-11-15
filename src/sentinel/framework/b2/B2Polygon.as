package sentinel.framework.b2
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	public class B2Polygon implements IB2Shape
	{
		
		private var _base:b2PolygonShape;
		private var _verticies:Vector.<B2Vector2D>;
		
		
		public function B2Polygon(verticies:Vector.<B2Vector2D>)
		{
			var nativeVerticies:Array = [];
			
			for each(var i:B2Vector2D in verticies)
			{
				nativeVerticies.push(i.base);
			}
			
			_base = new b2PolygonShape();
			_base.SetAsArray(nativeVerticies);
			_verticies = verticies.slice();
		}
		
		
		public function get base():b2Shape{ return _base; }
		public function get verticies():Vector.<B2Vector2D>{ return _verticies; }
		
	}
	
}