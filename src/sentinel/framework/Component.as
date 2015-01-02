package sentinel.framework
{
	
	import starling.core.Starling;
	import sentinel.framework.events.EventDispatcher;
	
	
	/**
	 * Defines a core game component, managed by the central Game class. Components are initialized
	 * once at the start of the game and persist throughout the lifetime of the game. Inbuilt
	 * components include the Keyboard, Mouse, Library, Storage, Viewport, and more.
	 * @author Marty Wallace.
	 */
	public class Component extends EventDispatcher
	{
		
		/**
		 * Internal alias for <code>construct()</code>.
		 */
		internal function __construct():void
		{
			construct();
		}
		
		
		/**
		 * Initialize the Component. This is called after the Game has finished defining all of the
		 * components first, allowing you to safely access other components.
		 */
		protected function construct():void
		{
			//
		}
		
		
		/**
		 * Returns the active Starling instance.
		 */
		public function get starling():Starling { return Starling.current; }
		
		/**
		 * Returns the active Game instance.
		 */
		public function get game():BaseGame { return BaseGame.getInstance(); }
		
		/**
		 * Returns the name of this component. The component name must be unique across all
		 * components that your game will use at one time.
		 */
		public function get name():String { return null; }
		
	}
	
}