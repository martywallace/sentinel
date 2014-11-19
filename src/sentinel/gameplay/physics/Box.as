package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	/**
	 * A box shape.
	 * @author Marty Wallace.
	 */
	public class Box implements IShape
	{
		
		private var _base:b2PolygonShape;
		
		
		public function Box(width:int, height:int, x:int = 0, y:int = 0, rotation:Number = 0):void
		{
			_base = new b2PolygonShape();
			
			var mwidth:Number = (width / 2) / Engine.scale;
			var mheight:Number = (height / 2) / Engine.scale;
			var center:Vector2D = new Vector2D(x, y);
			
			_base.SetAsOrientedBox(mwidth, mheight, center.base, rotation);
		}
		
		
		public function get base():b2Shape{ return _base; }
		
	}
	
}