package sentinel.gameplay.physics
{
	
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	import sentinel.framework.IStorable;
	import sentinel.framework.util.StringUtil;
	import sentinel.framework.util.ObjectUtil;
	import sentinel.framework.Data;
	
	
	/**
	 * A Vector in 2D space.
	 * @author Marty Wallace.
	 * 
	 * @csharp I'll be glad to not have to mess around with Vector2D -> Point -> Vector2D conversions.
	 */
	public class Vector2D implements IStorable
	{
		
		private var _base:b2Vec2;
		
		
		/**
		 * Creates a Vector2D whose x and y values represent a given direction.
		 * @param angle The direction angle.
		 * @param length The distance along the given direction angle.
		 */
		public static function inDirection(angle:Number, length:Number):Vector2D
		{
			return new Vector2D(Math.cos(angle) * length, Math.sin(angle) * length);
		}
		
		
		/**
		 * Creates a Vector2D from an instance of <code>flash.geom.Point</code>.
		 * @param point The target Point.
		 */
		public static function fromPoint(point:Point):Vector2D
		{
			return new Vector2D(point.x, point.y);
		}
		
		
		internal static function __fromBase(base:b2Vec2):Vector2D
		{
			return new Vector2D(base.x * Engine.scale, base.y * Engine.scale);
		}
		
		
		/**
		 * Constructor.
		 * @param x The vector value along the x axis.
		 * @param y The vector value along the y axis.
		 */
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			_base = new b2Vec2(x / Engine.scale, y / Engine.scale);
		}
		
		
		/**
		 * Creates and returns a new Vector2D who is an exact clone of this Vector2D.
		 */
		public function clone():Vector2D
		{
			return new Vector2D(x, y);
		}
		
		
		public function toString():String
		{
			return StringUtil.toDebugString(['x', 'y'], [x, y]);
		}
		
		
		/**
		 * Saves a simple representation of this Vector2D.
		 */
		public function save():Data
		{
			return Data.create({ x: x, y: y });
		}
		
		
		/**
		 * Loads the values of a simple representation of a Vector2D into this Vector2D.
		 * @param data The data to load from.
		 */
		public function load(data:Data):void
		{
			x = data.get('x', 0);
			y = data.get('y', 0);
		}
		
		
		/**
		 * Adds the x and y values of this Vector2D with another and returns a new Vector2D whose
		 * x and y values are the result.
		 * @param vector2d The target Vector2D to add this Vector2D with.
		 */
		public function add(vector2d:Vector2D):Vector2D
		{
			return new Vector2D(x + vector2d.x, y + vector2d.y);
		}
		
		
		/**
		 * Subtracts the x and y values of a target Vector2D from this Vector2D and returns a new
		 * Vector2D whose x and y values are the result.
		 * @param vector2d The target Vector2D to subtract from this Vector2D.
		 */
		public function subtract(vector2d:Vector2D):Vector2D
		{
			return new Vector2D(x - vector2d.x, y - vector2d.y);
		}
		
		
		/**
		 * Returns the distance between this Vector2D and a target Vector2D.
		 * @param vector2d The target Vector2D.
		 */
		public function distanceTo(vector2d:Vector2D):Number
		{
			var a:Number = vector2d.x - x;
			var b:Number = vector2d.y - y;
			
			return Math.sqrt(a * a + b * b);
		}
		
		
		/**
		 * Returns the angle between this Vector2D and a target Vector2D in radians.
		 * @param vector2d The target Vector2D.
		 */
		public function angleTo(vector2d:Vector2D):Number
		{
			return Math.atan2(vector2d.y - y, vector2d.x - x);
		}
		
		
		/**
		 * Alias for <code>Math.cos(angleTo(vector2d))</code>.
		 * @param vector2d The target Vector2D.
		 */
		public function cosTo(vector2d:Vector2D):Number
		{
			return Math.cos(angleTo(vector2d));
		}
		
		
		/**
		 * Alias for <code>Math.sin(angleTo(vector2d))</code>.
		 * @param vector2d The target Vector2D.
		 */
		public function sinTo(vector2d:Vector2D):Number
		{
			return Math.sin(angleTo(vector2d));
		}
		
		
		/**
		 * Returns a new Vector2D whose position is a given angle and distance from this Vector2D.
		 * @param angle The angle to cast at.
		 * @param distance The distance to cast.
		 */
		public function cast(angle:Number, distance:Number):Vector2D
		{
			return Vector2D.inDirection(angle, distance).add(this);
		}
		
		
		/**
		 * Create and return a <code>flash.geom.Point</code> whose x and y values are set to the x
		 * and y values of this Vector2D.
		 */
		public function toPoint():Point
		{
			return new Point(x, y);
		}
		
		
		/**
		 * Determine whether this Vector2D has x and y values exactly equal to the target Vector2D.
		 * @param vector2d The target Vector2D.
		 */
		public function equals(vector2d:Vector2D):Boolean
		{
			return x === vector2d.x && y === vector2d.y;
		}
		
		
		/**
		 * Simultaneously assing new x and y values to this Vector2D.
		 * @param x The new x axis value.
		 * @param y The new y axis value.
		 */
		public function set(x:Number, y:Number):void
		{
			_base.x = x / Engine.scale;
			_base.y = y / Engine.scale;
		}
		
		
		internal function get __base():b2Vec2 { return _base; }
		
		/**
		 * The vector value along the x axis.
		 */
		public function get x():Number { return _base.x * Engine.scale; }
		public function set x(value:Number):void{ _base.Set(value / Engine.scale, _base.y); }
		
		/**
		 * The vector value along the y axis.
		 */
		public function get y():Number { return _base.y * Engine.scale; }
		public function set y(value:Number):void{ _base.Set(_base.x, value / Engine.scale); }
		
		/**
		 * The length of the vector.
		 */
		public function get length():Number { return Math.sqrt(x * x + y * y); }
		
		/**
		 * The angle of the vector.
		 */
		public function get angle():Number { return Math.atan2(y, x); }
		
		/**
		 * Whether or not this vector's x and y values are both 0.
		 */
		public function get isZero():Boolean { return x === 0 && y === 0; }
		
	}
	
}