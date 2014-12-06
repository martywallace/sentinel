package sentinel.framework
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Viewport;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.client.Storage;
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
	public class Game extends Sprite
	{
		
		private var _state:State;
		private var _components:Object = { };
		
		
		public function Game()
		{
			//
		}
		
		
		internal function __construct():void
		{
			// Define all required components.
			var components:Vector.<Component> = new <Component>[
				new Viewport(), new Library(),
				new Mouse(), new Keyboard(),
				new Audio(), new Storage()
			];
			
			components.concat(defineComponents() || new <Component>[]);
			
			for each(var component:Component in components)
			{
				if (!_components.hasOwnProperty(component.name))
				{
					_components[component.name] = component;
				}
				else
				{
					// Cannot have two Components with the same name.
					throw new Error('A Component named "' + component.name + '" already exists.');
				}
			}
			
			// Initialize components - this step is done in a later loop to ensure components that
			// depend on the existence of other components function correctly.
			for (var componentName:String in _components)
			{
				(_components[componentName] as Component).__construct();
			}
			
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
		
		
		protected function defineComponents():Vector.<Component>
		{
			return null;
		}
		
		
		protected function getComponent(name:String):Component
		{
			return _components[name];
		}
		
		
		public function get starling():Starling { return Starling.current; }
		public function get state():State { return _state; }
		public function get keyboard():Keyboard{ return getComponent('keyboard') as Keyboard; }
		public function get mouse():Mouse { return getComponent('mouse') as Mouse; }
		public function get library():Library { return getComponent('library') as Library; }
		public function get audio():Audio { return getComponent('audio') as Audio; }
		public function get storage():Storage { return getComponent('storage') as Storage; }
		public override function get viewport():Viewport { return getComponent('viewport') as Viewport; }
		
		
		public function get identity():String { return null; }
		
	}
	
}