package sentinel.framework
{
	
	import sentinel.framework.graphics.Viewport;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.sound.Audio;
	import sentinel.framework.client.Storage;
	
	
	/**
	 * Describes an object that is able to access all of the core game services.
	 * @author Marty Wallace.
	 */
	public interface IGameServiceProvider
	{
		
		/**
		 * A reference to the game Viewport service.
		 */
		function get viewport():Viewport;
		
		/**
		 * A reference to the game Mouse service.
		 */
		function get mouse():Mouse;
		
		/**
		 * A reference to the game Keyboard service.
		 */
		function get keyboard():Keyboard;
		
		/**
		 * A reference to the game Library service.
		 */
		function get library():Library;
		
		/**
		 * A reference to the game Audio service.
		 */
		function get audio():Audio;
		
		/**
		 * A reference to the game Storage service.
		 */
		function get storage():Storage;
		
	}
	
}