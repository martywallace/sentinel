package sentinel.gameplay
{
	
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * A contract defining an object that is able to provide its position. The meaning of an object's
	 * position is defined by the object itself. Most likely, the position of an object describes
	 * the position of graphics representing it.
	 * @author Marty Wallace.
	 */
	public interface IPositionProvider
	{
		
		/**
		 * Simultaneously update the x and y values of this object's position.
		 * @param x The new x value.
		 * @param y The new y value.
		 */
		function moveTo(x:Number, y:Number):void;
		
		/**
		 * The x position of this object.
		 */
		function get x():Number;
		function set x(value:Number):void;
		
		/**
		 * The y position of this object.
		 */
		function get y():Number;
		function set y(value:Number):void;
		
		/**
		 * The rotation of this object.
		 */
		function get rotation():Number;
		function set rotation(value:Number):void;
		
		/**
		 * The position of this object as a <code>Vector2D</code> instance. It is very unlikely that
		 * modifying the x and y values of this instance directly will provide the desired results;
		 * use the x and y properties of the <code>IPositionProvider</code> instead.
		 */
		function get position():Vector2D;
		function set position(value:Vector2D):void;
		
	}
	
}