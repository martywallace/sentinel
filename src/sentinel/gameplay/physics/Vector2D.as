package sentinel.gameplay.physics
{
	
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	import sentinel.framework.Data;
	import sentinel.framework.IStorable;
	
	
	/**
	 * A Vector in 2D space.
	 * @author Marty Wallace.
	 * 
	 * @csharp I'll be glad to not have to mess around with Vector2D -> Point -> Vector2D conversions.
	 */
	public class Vector2D implements IStorable
	{
		
		private var _x:Number;
		private var _y:Number;
		private var _base:b2Vec2;
		
		
		public static function fromPoint(point:Point):Vector2D
		{
			return new Vector2D(point.x, point.y);
		}
		
		
		/**
		 * Creates a Vector2D whose <code>x</code> and <code>y</code> values represent a given direction.
		 * @param angle The direction angle.
		 * @param length The distance along the given direction angle.
		 */
		public static function inDirection(angle:Number, length:Number):Vector2D
		{
			return new Vector2D(Math.cos(angle) * length, Math.sin(angle) * length);
		}
		
		
		/**
		 * @private
		 * Creates a Sentinel <code>Vector2D</code> from a Box2D <code>b2Vec2</code>.
		 * @param base The source b2Vec2.
		 */
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
			_x = x;
			_y = y;
			_base = new b2Vec2(x / Engine.scale, y / Engine.scale);
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
		 * Offset the <code>x</code> and <code>y</code> values of this Vector2D by the provided values.
		 * @param x The offset value along the x axis.
		 * @param y The offset value along the y axis.
		 */
		public function offset(x:Number, y:Number):void
		{
			_x += x;
			_y += y;
		}
		
		
		/**
		 * Simultaneously assing new x and y values to this Vector2D.
		 * @param x The new x axis value.
		 * @param y The new y axis value.
		 */
		public function setTo(x:Number, y:Number):void
		{
			_base.Set(x / Engine.scale, y / Engine.scale);
			super.setTo(x, y);
		}
		
		
		/**
		 * Determine whether the <code>x</code> and <code>y</code> values of this Vector2D match another.
		 * @param vector The subject Vector2D.
		 */
		public function equals(vector:Vector2D):Boolean
		{
			return _x === vector.x && _y === vector.y;
		}
		
		
		/**
		 * Adds the <code>x</code> and <code>y</code> values of the target Vector2D to this Vector2D.
		 * @param vector The target Vector2D.
		 */
		public function add(vector:Vector2D):Vector2D
		{
			return new Vector2D(_x + vector.x, _y + vector.y);
		}
		
		
		/**
		 * Subtracts the <code>x</code> and <code>y</code> values of the target Vector2D from this Vector2D.
		 * @param vector The target Vector2D.
		 */
		public function subtract(vector:Vector2D):Vector2D
		{
			return new Vector2D(_x - vector.x, _y - vector.y);
		}
		
		
		/**
		 * Scales the line segment between <code>0, 0</code> and the current Vector2D to a set length.
		 * @param thickness The scaling value.
		 */
		public function normalize(thickness:Number):void
		{
			var len:Number = length;
			
			if (len !== 0)
			{
				x = thickness * x / len;
				y = thickness * y / len;
			}
		}
		
		
		/**
		 * Returns the distance between this Vector2D and a set of input coordinates.
		 * @param x The x coordinate.
		 * @param y The y coordinate.
		 */
		public function distanceToCoords(x:Number, y:Number):Number
		{
			var a:Number = x - _x;
			var b:Number = y - _y;
			
			return Math.sqrt(a * a + b * b);
		}
		
		
		/**
		 * Returns the distance between this Vector2D and a target Vector2D.
		 * @param vector The target Vector2D.
		 */
		public function distanceTo(vector:Vector2D):Number
		{
			return distanceToCoords(vector.x, vector.y);
		}
		
		
		/**
		 * Returns the angle between this Vector2D and a set of input coordinates.
		 * @param x The x coordinate.
		 * @param y The y coordinate.
		 */
		public function angleToCoords(x:Number, y:Number):Number
		{
			return Math.atan2(y - _y, x - _x);
		}
		
		
		/**
		 * Returns the angle between this Vector2D and a target Vector2D in radians.
		 * @param vector The target Vector2D.
		 */
		public function angleTo(vector:Vector2D):Number
		{
			return angleToCoords(vector.x, vector.y);
		}
		
		
		/**
		 * Alias for <code>Math.cos(angleTo(vector))</code>.
		 * @param vector The target Vector2D.
		 */
		public function cosTo(vector:Vector2D):Number
		{
			return Math.cos(angleTo(vector));
		}
		
		
		/**
		 * Alias for <code>Math.sin(angleTo(vector))</code>.
		 * @param vector The target Vector2D.
		 */
		public function sinTo(vector:Vector2D):Number
		{
			return Math.sin(angleTo(vector));
		}
		
		
		/**
		 * Returns a new Vector2D whose <code>x</code> and <code>y</code> values are a given angle
		 * and distance from this Vector2D.
		 * @param angle The angle to cast at.
		 * @param distance The distance to cast.
		 */
		public function cast(angle:Number, distance:Number):Vector2D
		{
			var distant:Vector2D = Vector2D.inDirection(angle, distance);
			
			distant.x += x;
			distant.y += y;
			
			return distant;
		}
		
		
		/**
		 * Creates and returns a new Point with the same value as this Vector2D.
		 */
		public function toPoint():Point
		{
			return new Point(_x, _y);
		}
		
		
		/**
		 * @private
		 */
		internal function get __base():b2Vec2 { return _base; }
		
		/**
		 * The value of this Vector2D along the x axis.
		 */
		public function get x():Number { return _x; }
		public function set x(value:Number):void
		{
			_base.Set(value / Engine.scale, _base.y);
			_x = value;
		}
		
		/**
		 * The valueo f this Vector2D along the y axis.
		 */
		public function get y():Number { return _y; }
		public function set y(value:Number):void
		{
			_base.Set(_base.x, value / Engine.scale);
			_y = value;
		}
		
		/**
		 * The line length represented by the x and y values of this Vector2D.
		 */
		public function get length():Number { return Math.sqrt(_x * _x + _y * _y); }
		
		/**
		 * The angle from <code>0, 0</code> represented by the <code>x</code> and <code>y</code>
		 * values of this Vector2D.
		 */
		public function get angle():Number { return Math.atan2(y, x); }
		
		/**
		 * Determine whether the <code>x</code> and <code>y</code> values are both zero.
		 */
		public function get isZero():Boolean{ return _x === 0 && _y === 0; }
		
	}
	
}