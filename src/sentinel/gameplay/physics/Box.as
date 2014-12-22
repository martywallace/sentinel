package sentinel.gameplay.physics
{
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	
	
	/**
	 * A box shape.
	 * @author Marty Wallace.
	 */
	public class Box extends Shape
	{
		
		private var _width:Number;
		private var _height:Number;
		private var _x:int;
		private var _y:int;
		private var _rotation:Number;
		
		
		public function Box(width:int, height:int, x:int = 0, y:int = 0, rotation:Number = 0):void
		{
			_width = width;
			_height = height;
			_x = x;
			_y = y;
			_rotation = rotation;
			
			super();
		}
		
		
		protected override function defineBase():b2Shape
		{
			var base:b2PolygonShape = new b2PolygonShape();
			var center:Vector2D = new Vector2D(_x, _y);
			
			base.SetAsOrientedBox((_width / 2) / Engine.scale, (_height / 2) / Engine.scale, center.base, _rotation);
			
			return base;
		}
		
	}
	
}