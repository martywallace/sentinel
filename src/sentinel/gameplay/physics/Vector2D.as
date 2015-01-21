package sentinel.gameplay.physics
{
	
	import Box2D.Common.Math.b2Vec2;
	import starling.geom.Point;
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
	public class Vector2D extends Point implements IStorable
	{
		
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
			super(x, y);
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
		 * Simultaneously assing new x and y values to this Vector2D.
		 * @param x The new x axis value.
		 * @param y The new y axis value.
		 */
		public override function setTo(x:Number, y:Number):void
		{
			_base.Set(x / Engine.scale, y / Engine.scale);
			super.setTo(x, y);
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
		
		
		internal function get __base():b2Vec2 { return _base; }
		
		
		public override function set x(value:Number):void
		{
			_base.Set(value / Engine.scale, _base.y);
			super.x = value;
		}
		
		
		public override function set y(value:Number):void
		{
			_base.Set(_base.x, value / Engine.scale);
			super.y = value;
		}
		
	}
	
}