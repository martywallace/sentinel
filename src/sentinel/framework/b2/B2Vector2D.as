package sentinel.framework.b2
{
	
	import Box2D.Common.Math.b2Vec2;
	
	
	public class B2Vector2D
	{
		
		private var _base:b2Vec2;
		
		
		public function B2Vector2D(x:Number = 0, y:Number = 0)
		{
			_base = new b2Vec2(x / B2World.scale, y / B2World.scale);
		}
		
		
		public function add(vector2d:B2Vector2D):B2Vector2D
		{
			return new B2Vector2D(x + vector2d.x, y + vector2d.y);
		}
		
		
		public function subtract(vector2d:B2Vector2D):B2Vector2D
		{
			return new B2Vector2D(x - vector2d.x, y - vector2d.y);
		}
		
		
		public function get base():b2Vec2 { return _base; }
		
		
		public function get x():Number{ return _base.x * B2World.scale; }
		public function set x(value:Number):void { _base.x = value / B2World.scale; }
		
		public function get y():Number{ return _base.y * B2World.scale; }
		public function set y(value:Number):void { _base.y = value / B2World.scale; }
		
		public function get length():Number { return Math.sqrt(x * x + y * y); }
		public function get angle():Number { return Math.atan2(y, x); }
		
	}
	
}