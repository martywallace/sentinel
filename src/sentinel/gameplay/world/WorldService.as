package sentinel.gameplay.world
{	
	
	import sentinel.framework.IGameServiceProvider;
	import sentinel.framework.Library;
	import sentinel.framework.Service;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Storage;
	import sentinel.framework.graphics.Viewport;
	import sentinel.framework.sound.Audio;
	
	
	/**
	 * Provides a service to be used by the World, e.g. an enemy spawner, pickup generator, etc.
	 * @author Marty Wallace.
	 */
	public class WorldService extends Service implements IGameServiceProvider
	{
		
		/**
		 * A reference to the world being serviced by this WorldService.
		 */
		protected function get world():BaseWorld { return serviceable as BaseWorld; }
		
		/**
		 * A reference to the game Viewport service.
		 */
		public function get viewport():Viewport { return game.viewport; }
		
		/**
		 * A reference to the game Mouse service.
		 */
		public function get mouse():Mouse { return game.mouse; }
		
		/**
		 * A reference to the game Keyboard service.
		 */
		public function get keyboard():Keyboard { return game.keyboard; }
		
		/**
		 * A reference to the game Library service.
		 */
		public function get library():Library { return game.library; }
		
		/**
		 * A reference to the game Audio service.
		 */
		public function get audio():Audio { return game.audio; }
		
		/**
		 * A reference to the game Storage service.
		 */
		public function get storage():Storage { return game.storage; }
		
	}
	
}