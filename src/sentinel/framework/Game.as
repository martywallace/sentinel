package sentinel.framework {
	
	import flash.display.Sprite;
	
	import sentinel.framework.State;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Storage;
	import sentinel.framework.graphics.Viewport;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * The game is extended by your document class. It initializes the Starling display tree,
	 * inbuilt game components, update loop and various other crucial framework components.
	 * 
	 * @author Marty Wallace
	 */
	public class Game extends Sprite {
		
		private static var _instance:Game;
		
		/**
		 * Fetch a static reference to the game document class.
		 */
		public static function getInstance():Game {
			return _instance;
		}
		
		private var _starling:Starling;
		private var _state:State;
		private var _nextId:uint = 0;
		
		private var _keyboard:Keyboard;
		private var _mouse:Mouse;
		private var _storage:Storage;
		private var _library:Library;
		
		/**
		 * Constructor.
		 */
		public function Game() {
			_instance = this;
			
			_starling = new Starling(Viewport, stage);
			_starling.antiAliasing = settings.antiAliasing;
			_starling.addEventListener(Event.ROOT_CREATED, _rootCreated);
			
			if (settings.debug) {
				_starling.showStats = true;
				
				// TODO: Might want to enable some other useful development items here.
				// ...
			}
		}
		
		/**
		 * Get a unique number. This number begins at 1 when the game begins and increments each
		 * time this function is called, meaning it is guaranteed to be unique each time it is used
		 * for a single game session.
		 */
		public function getUniqueId():uint {
			return _nextId++;
		}
		
		/**
		 * Loads a new game state. If a current game state is already active, unload that state.
		 * @param state The new game state to load.
		 */
		public function loadState(state:State):void {
			unloadState();
			
			_state = state;
			
			if (state.graphics !== null) {
				viewport.addChild(state.graphics);
			}
			
			viewport.backgroundColor = state.backgroundColor;
		}
		
		/**
		 * Unloads the current game state. This method is automatically called each time a new state
		 * is loaded.
		 */
		public function unloadState():void {
			if (_state !== null) {
				_state.deconstruct();
			}
			
			_state = null;
			
			viewport.backgroundColor = settings.backgroundColor;
		}
		
		/**
		 * Called when Starling and the inbuild game components are finished being set up. Overridde
		 * this method to use as your game constructor.
		 */
		protected function construct():void { }
		
		/**
		 * Called every frame during the lifetime of the game. Override this method to use as your
		 * game update entrypoint.
		 */
		protected function update():void { }
		
		/**
		 * Defines custom game services to be bound to the core game class.
		 */
		protected function defineServices():void { }
		
		private function _rootCreated(event:Event):void {
			_starling.root.addEventListener(Event.ENTER_FRAME, _update);
			_starling.removeEventListener(Event.ROOT_CREATED, _rootCreated);
			_starling.start();
			
			_keyboard = new Keyboard();
			_mouse = new Mouse();
			_storage = new Storage();
			_library = new Library();
			
			construct();
		}
		
		private function _update(event:Event):void {
			update();
			
			if (_state !== null) {
				_state.__update();
			}
		}
		
		/** The game viewport. */
		public function get viewport():Viewport { return _starling.root as Viewport; }
		
		/** The game settings. */
		public function get settings():GameSettings { return new GameSettings(); }
		
		/** The active game state. */
		public function get state():State { return _state; }
		
		/** The game keyboard manager. */
		public function get keyboard():Keyboard { return _keyboard; }
		
		/** The game mouse manager. */
		public function get mouse():Mouse { return _mouse; }
		
		/** The game storage. */
		public function get storage():Storage { return _storage; }
		
		/** The game asset library. */
		public function get library():Library { return _library; }
		
	}

}