package sentinel.framework {
	
	import flash.display.Sprite;
	import sentinel.framework.graphics.Viewport;
	import sentinel.framework.State;
	import sentinel.framework.util.NumberUtil;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * The base is extended by your document class. It initializes the Starling display tree,
	 * inbuilt game components, update loop and various other crucial framework components.
	 * 
	 * @author Marty Wallace
	 */
	public class Base extends Sprite {
		
		private static var _instance:Base;
		
		/**
		 * Fetch a static reference to the game document class.
		 */
		public static function getInstance():Base {
			return _instance;
		}
		
		private var _starling:Starling;
		private var _state:State;
		private var _nextId:uint = 0;
		
		/**
		 * Constructor.
		 */
		public function Base() {
			_instance = this;
			
			_starling = new Starling(Viewport, stage);
			
			_starling.showStats = debug;
			_starling.antiAliasing = NumberUtil.clamp(antiAliasing, 0, 16);
			_starling.addEventListener(Event.ROOT_CREATED, _rootCreated);
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
			
			if (_state.graphics !== null) {
				viewport.backgroundColor = _state.backgroundColor;
				viewport.addChild(_state.graphics);
			}
		}
		
		/**
		 * Unloads the current game state. This method is automatically called each time a new state
		 * is loaded.
		 */
		public function unloadState():void {
			if (_state !== null) {
				_state.deconstruct();
			}
			
			viewport.backgroundColor = Viewport.DEFAULT_BACKGROUND_COLOR;
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
		
		private function _rootCreated(event:Event):void {
			_starling.root.addEventListener(Event.ENTER_FRAME, _update);
			_starling.removeEventListener(Event.ROOT_CREATED, _rootCreated);
			_starling.start();
			
			construct();
		}
		
		private function _update(event:Event):void {
			update();
			
			if (_state !== null) {
				_state.__update();
			}
		}
		
		/**
		 * The game viewport.
		 */
		public function get viewport():Viewport { return _starling.root as Viewport; }
		
		/**
		 * The anti-aliasing level to use when drawing Starling graphics.
		 */
		public function get antiAliasing():int { return 0; }
		
		/**
		 * Whether or not the game is in debug mode.
		 */
		public function get debug():Boolean { return false; }
		
	}

}