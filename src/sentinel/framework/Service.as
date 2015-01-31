package sentinel.framework
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Storage;
	import sentinel.framework.events.EventDispatcher;
	import sentinel.framework.graphics.Viewport;
	import sentinel.framework.sound.Audio;
	
	
	/**
	 * Describes a service provided to an IServiceable.
	 * @author Marty Wallace.
	 */
	public class Service extends EventDispatcher implements IGameServiceProvider
	{
		
		private var _serviceable:IServiceable;
		
		
		/**
		 * @private
		 */
		internal function __construct(serviceable:IServiceable):void
		{
			_serviceable = serviceable;
			construct();
		}
		
		
		protected function construct():void
		{
			//
		}
		
		
		/**
		 * @private
		 */
		internal function __update():void
		{
			update();
		}
		
		
		protected function update():void
		{
			//
		}
		
		
		/**
		 * The object being serviced by this Service.
		 */
		protected function get serviceable():IServiceable { return _serviceable; }
		
		/**
		 * A reference to the core game object.
		 */
		protected function get game():BaseGame { return BaseGame.getInstance(); }
		
		/**
		 * Returns the name of this service.
		 */
		public function get name():String { return null; }
		
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