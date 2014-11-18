package sentinel.gameplay.scene
{
	
	import sentinel.framework.b2.B2Debug;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.b2.B2WorldDef;
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.Thing;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.UI;
	import starling.display.DisplayObject;
	
	
	public class World extends Thing
	{
		
		private var _physics:B2World;
		private var _camera:Camera;
		private var _frozen:Boolean = false;
		private var _graphics:IGraphicsContainer;
		private var _content:Sprite;
		private var _ticks:uint = 0;
		
		
		public function World(definition:B2WorldDef = null, debug:B2Debug = null)
		{
			if (definition !== null)
			{
				_physics = new B2World(definition, debug);
			}
			
			_graphics = new Sprite();
			_content = new Sprite();
			_camera = new Camera(this);
			
			_graphics.addChild(_content);
		}
		
		
		public override function deconstruct():void
		{
			if (_physics !== null)
			{
				_physics.deconstruct();
			}
			
			_graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		public override function update():void
		{
			if (!_frozen)
			{
				_ticks ++;
				
				if (_physics !== null) _physics.update();
				
				super.update();
			}
		}
		
		
		/**
		 * Adds a Being to this World.
		 * @param being The Being to add.
		 * @throws ArgumentError
		 */
		public override function add(being:Thing):Thing
		{
			if (being is Being) return super.add(being);
			else throw new ArgumentError("World.add() only accepts instances of Being.");
			
			return null;
		}
		
		
		/**
		 * Removes a Being from this World.
		 * @param being The Being to remove.
		 * @param destroy Whether or not to also deconstruct the Being once removed.
		 * @throws ArgumentError
		 */
		public override function remove(being:Thing, destroy:Boolean = false):Thing
		{
			if (being is Being) return super.remove(being, destroy);
			throw new ArgumentError("World.remove() only accepts instances of Being.");
			
			return null;
		}
		
		
		/**
		 * If this World is part of a GameplayState, returns the UI associated with that GameplayState.
		 * Else returns null.
		 */
		public function get ui():UI
		{
			if (game.state is GameplayState)
			{
				return (game.state as GameplayState).ui;
			}
			
			return null;
		}
		
		
		public function get physics():B2World { return _physics; }
		public function get graphics():IGraphicsContainer { return _graphics; }
		public function get camera():Camera { return _camera; }
		public function get frozen():Boolean { return _frozen; }
		public function set frozen(value:Boolean):void { _frozen = value; }
		public function get ticks():uint { return _ticks; }
		
		internal function get __content():Sprite { return _content; }
		
	}
	
}