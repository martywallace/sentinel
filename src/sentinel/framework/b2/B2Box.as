package sentinel.framework.b2
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	/**
	 * A box shape.
	 * @author Marty Wallace.
	 */
	public class B2Box implements IB2Shape
	{
		
		private var _base:b2PolygonShape;
		
		
		public function B2Box(width:int, height:int, x:int = 0, y:int = 0, rotation:Number = 0):void
		{
			_base = new b2PolygonShape();
			
			var mwidth:Number = (width / 2) / B2World.scale;
			var mheight:Number = (height / 2) / B2World.scale;
			var center:B2Vector2D = new B2Vector2D(x, y);
			
			_base.SetAsOrientedBox(mwidth, mheight, center.base, rotation);
		}
		
		
		public function get base():b2Shape{ return _base; }
		
	}
	
}