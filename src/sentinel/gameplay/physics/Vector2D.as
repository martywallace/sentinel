package sentinel.gameplay.physics
{
	
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	import sentinel.framework.IStorable;
	import sentinel.framework.util.StringUtil;
	import sentinel.framework.util.ObjectUtil;
	
	
	public class Vector2D implements IStorable
	{
		
		private var _base:b2Vec2;
		
		
		public static function inDirection(angle:Number, length:Number):Vector2D
		{
			return new Vector2D(Math.cos(angle) * length, Math.sin(angle) * length);
		}
		
		
		public static function fromPoint(point:Point):Vector2D
		{
			return new Vector2D(point.x, point.y);
		}
		
		
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			_base = new b2Vec2(x / Engine.scale, y / Engine.scale);
		}
		
		
		public function toString():String
		{
			return StringUtil.toDebugString(['x', 'y'], [x, y]);
		}
		
		
		public function save():Object
		{
			return { x: x, y: y };
		}
		
		
		public function load(data:Object):void
		{
			x = ObjectUtil.prop(data, 'x', 0);
			y = ObjectUtil.prop(data, 'y', 0);
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
			var a:Number = vector2d.x - x;
			var b:Number = vector2d.y - y;
			
			return Math.sqrt(a * a + b * b);
		}
		
		
		public function angleTo(vector2d:Vector2D):Number
		{
			return Math.atan2(vector2d.y - y, vector2d.x - x);
		}
		
		
		public function toPoint():Point
		{
			return new Point(x, y);
		}
		
		
		public function get base():b2Vec2 { return _base; }
		
		public function get x():Number { return _base.x * Engine.scale; }
		public function set x(value:Number):void{ _base.Set(value / Engine.scale, _base.y); }
		
		public function get y():Number { return _base.y * Engine.scale; }
		public function set y(value:Number):void{ _base.Set(_base.x, value / Engine.scale); }
		
		public function get length():Number { return Math.sqrt(x * x + y * y); }
		public function get angle():Number { return Math.atan2(y, x); }
		
		public function get isZero():Boolean { return x === 0 && y === 0; }
		
	}
	
}