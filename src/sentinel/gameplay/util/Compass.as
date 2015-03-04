package sentinel.gameplay.util
{
	
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * The Compass utility provides methods for translating compass directions into more useful data
	 * structures e.g. degrees, vectors, etc.
	 * @author Marty Wallace.
	 */
	public class Compass
	{
		
		public static const NORTH:String = 'n';
		public static const SOUTH:String = 's';
		public static const EAST:String = 'e';
		public static const WEST:String = 'w';
		public static const NORTH_EAST:String = 'ne';
		public static const SOUTH_EAST:String = 'se';
		public static const NORTH_WEST:String = 'nw';
		public static const SOUTH_WEST:String = 'sw';
		
		
		/**
		 * Converts a compass direction to a Vector2D representing the direction.
		 * @param direction The compass direction e.g. <code>Compass.NORTH</code>.
		 * @param length The length of the result Vector2D.
		 */
		public static function toVector(direction:String, length:Number = 1):Vector2D
		{
			return Vector2D.inDirection(toAngle(direction), length);
		}
		
		
		/**
		 * Converts a compass direction to its angle in radians.
		 * @param direction The compass direction e.g. <code>Compass.NORTH</code>.
		 */
		public static function toAngle(direction:String):Number
		{
			var ei:Number = Math.PI / 4;
			
			switch(direction)
			{
				case EAST: return 0; break;
				case SOUTH_EAST: return ei; break;
				case SOUTH: return ei * 2; break;
				case SOUTH_WEST: return ei * 3; break;
				case WEST: return ei * 4; break;
				case NORTH_WEST: return ei * 5; break;
				case NORTH: return ei * 6; break;
				case NORTH_EAST: return ei * 7; break;
			}
			
			return 0;
		}
		
	}
	
}