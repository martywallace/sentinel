package sentinel.gameplay.physics
{
	
	import Box2D.Common.Math.b2Vec2;
	import sentinel.framework.util.StringUtil;
	
	
	public class Vector2D
	{
		
		private var _base:b2Vec2;
		
		
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			_base = new b2Vec2(x / Engine.scale, y / Engine.scale);
		}
		
		
		public function toString():String
		{
			return StringUtil.toDebugString(['x', 'y'], [x, y]);
		}
		
		
		public function add(vector2d:Vector2D):Vector2D
		{
			return new Vector2D(x + vector2d.x, y + vector2d.y);
		}
		
		
		public function subtract(vector2d:Vector2D):Vector2D
		{
			return new Vector2D(x - vector2d.x, y - vector2d.y);
		}
		
		
		public function distanceTo(vector2d:Vector2D):Number
		{
			return vector2d.subtract(this).length;
		}
		
		
		public function angleTo(vector2d:Vector2D):Number
		{
			return vector2d.subtract(this).angle;
		}
		
		
		public function get base():b2Vec2 { return _base; }
		
		public function get x():Number { return _base.x * Engine.scale; }
		public function set x(value:Number):void{ _base.Set(value / Engine.scale, _base.y); }
		
		public function get y():Number { return _base.y * Engine.scale; }
		public function set y(value:Number):void{ _base.Set(_base.x, value / Engine.scale); }
		
		public function get length():Number { return Math.sqrt(x * x + y * y); }
		public function get angle():Number { return Math.atan2(y, x); }
		
	}
	
}