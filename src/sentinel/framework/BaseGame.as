package sentinel.framework
{
	
	import sentinel.framework.audio.Audio;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Storage;
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.graphics.Viewport;
	import starling.animation.Juggler;
	import starling.core.Starling;
	import starling.events.EnterFrameEvent;
	
	
	/**
	 * The core game class passed to the constructor of <code>sentinel.framework.Core</code>. This
	 * is the base class for your main game class and should contain logic for initializing assets
	 * and the starting state.
	 * @author Marty Wallace.
	 */
	public class BaseGame extends Sprite implements IServiceable, IGameServiceProvider
	{
		
		/**
		 * Returns a reference to the core game class.
		 */
		public static function getInstance():BaseGame
		{
			return Starling.current.root as BaseGame;
		}
		
		
		private var _state:State;
		private var _solidBackground:Quad;
		private var _services:ServiceManager;
		private var _nextId:uint = 1;
		
		
		/**
		 * @private
		 */
		internal function __construct():void
		{
			_services = new ServiceManager(this, (new <Service>[
				new Viewport(),
				new Library(),
				new Mouse(),
				new Keyboard(),
				new Audio(),
				new Storage()
			]).concat(defineServices() || new <Service>[]));
			
			_services.construct();
			
			_solidBackground = new Quad(viewport.width, viewport.height, 0xFFFFFF);
			addChild(_solidBackground);
			
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
		 * @param stopMusic Whether or not to stop the current playing music. If the new state defines
		 * its own background track, it will override the music regardless of it being stopped or not.
		 */
		public function loadState(state:State, stopMusic:Boolean = true):void
		{
			unloadState(stopMusic);
			
			_state = state;
			_solidBackground.color = _state.__backgroundColor;
			
			if (_state.__backgroundMusic !== null)
			{
				// Play background music attached to the state.
				audio.music.play(_state.__backgroundMusic);
			}
			
			_state.graphics.addTo(this);
		}
		
		
		/**
		 * Unloads the current active state, if one exists. This method is automatically called at
		 * the beginning of <code>loadState()</code>.
		 * @param stopMusic Whether or not to stop the current playing music.
		 */
		public function unloadState(stopMusic:Boolean = true):void
		{
			if (_state !== null)
			{
				_state.deconstruct();
			}
			
			if (stopMusic)
			{
				audio.music.stopAll();
			}
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
		
		
		/**
		 * Defines a collection of Services that this game will use, combined with the default service
		 * list described by an <code>IGameServiceProvider</code>.
		 */
		protected function defineServices():Vector.<Service>
		{
			return null;
		}
		
		
		public function getService(name:String):Service
		{
			return _services.getService(name);
		}
		
		
		/**
		 * @private
		 */
		internal function __getNextId():uint
		{
			return _nextId++;
		}
		
		
		/**
		 * Reference to the current Starling instance.
		 */
		public function get starling():Starling { return Starling.current; }
		
		/**
		 * Reference to the current Starling Juggler instance.
		 */
		public function get juggler():Juggler { return starling.juggler; }
		
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