package sentinel.b2
{
	
	import Box2D.Common.Math.b2Vec2;
	import sentinel.geom.Vector2D;
	
	
	public class B2Vector2D extends Vector2D
	{
		
		private var _base:b2Vec2;
		
		
		public static function fromVector2d(vector2d:Vector2D):B2Vector2D
		{
			return new B2Vector2D(vector2d.x, vector2d.y);
		}
		
		
		public function B2Vector2D(x:Number = 0, y:Number = 0)
		{
			_base = new b2Vec2(x / B2World.scale, y / B2World.scale);
			super(x, y);
		}
		
		
		public function get base():b2Vec2 { return _base; }
		
		
		override public function get x():Number{ return _base.x * B2World.scale; }
		override public function set x(value:Number):void{ _base.x = value / B2World.scale; }
		override public function get y():Number{ return _base.y * B2World.scale; }
		override public function set y(value:Number):void{ _base.y = value / B2World.scale; }
		
	}
	
}