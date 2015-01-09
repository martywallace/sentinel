package sentinel.framework
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Storage;
	import sentinel.framework.client.Viewport;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.sound.Audio;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.EnterFrameEvent;
	
	
	/**
	 * The core game class passed to the constructor of <code>sentinel.framework.Core</code>. This
	 * is the base class for your main game class and should contain logic for initializing assets
	 * and the starting state.
	 * @author Marty Wallace.
	 */
	public class BaseGame extends Sprite implements IServiceable
	{
		
		/**
		 * Returns a reference to the core game class.
		 */
		public static function getInstance():BaseGame
		{
			return Starling.current.root as BaseGame;
		}
		
		
		private var _state:State;
		private var _services:ServiceManager;
		private var _nextId:uint = 1;
		
		
		internal function __construct():void
		{
			_services = new ServiceManager(this);
			
			// Define all required services.
			_services.setServices((new <Service>[
				new Viewport(), new Library(), new Mouse(), new Keyboard(), new Audio(), new Storage()
			]).concat(defineServices() || new <Service>[]));
			
			// Initialize user game construction code.
			construct();
			
			// Begin updating.
			addEventListener(EnterFrameEvent.ENTER_FRAME, _update);
		}
		
		
		protected function construct():void
		{
			//
		}
		
		
		/**
		 * Loads a new State. Unloads the current state, if one is set.
		 * @param state The new State to load.
		 */
		public function loadState(state:State):void
		{
			if (_state !== null)
			{
				_state.deconstruct();
			}
			
			_state = state;
			addChild(_state.graphics as DisplayObject);
		}
		
		
		private function _update(event:EnterFrameEvent):void
		{
			update();
			
			if (_state !== null)
			{
				_state.__update();
			}
		}
		
		
		protected function update():void
		{
			//
		}
		
		
		protected function defineServices():Vector.<Service>
		{
			return null;
		}
		
		
		protected function getService(name:String):Service
		{
			return _services.getService(name);
		}
		
		
		internal function __getNextId():uint
		{
			return _nextId++;
		}
		
		
		/**
		 * Reference to the current Starling instance.
		 */
		public function get starling():Starling { return Starling.current; }
		
		/**
		 * Reference to the current active State.
		 */
		public function get state():State { return _state; }
		
		/**
		 * Reference to the Keyboard service.
		 */
		public function get keyboard():Keyboard { return getService('keyboard') as Keyboard; }
		
		/**
		 * Reference to the Mouse service.
		 */
		public function get mouse():Mouse { return getService('mouse') as Mouse; }
		
		/**
		 * Reference to the Library service.
		 */
		public function get library():Library { return getService('library') as Library; }
		
		/**
		 * Reference to the Audio service.
		 */
		public function get audio():Audio { return getService('audio') as Audio; }
		
		/**
		 * Reference to the Storage service.
		 */
		public function get storage():Storage { return getService('storage') as Storage; }
		
		/**
		 * Reference to the Viewport service.
		 */
		public override function get viewport():Viewport { return getService('viewport') as Viewport; }
		
		/**
		 * The game identity string.
		 */
		public function get identity():String { return null; }
		
	}
	
}