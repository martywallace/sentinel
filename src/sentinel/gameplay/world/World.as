package sentinel.gameplay.world
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.IMouseDataProvider;
	import sentinel.framework.Thing;
	import sentinel.gameplay.events.WorldEvent;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.UI;
	
	
	/**
	 * The World is the core class for dealing with collections of Beings and the interactions
	 * between those Beings. The World also deals with initializing a physics engine, if required.
	 * @author Marty Wallace.
	 */
	public class World extends Thing implements IMouseDataProvider
	{
		
		private var _engine:Engine;
		private var _camera:Camera;
		private var _frozen:Boolean = false;
		private var _graphics:IGraphicsContainer;
		private var _content:Sprite;
		private var _ticks:uint = 0;
		private var _unique:Object = { };
		private var _map:Map;
		
		
		/**
		 * Constructor.
		 * @param engineDef An EngineDef describing the physics engine.
		 * @param debug A Debug instance describing the type of debugging to use.
		 */
		public function World(engineDef:EngineDef = null, debug:Debug = null)
		{
			if (engineDef !== null)
			{
				_engine = new Engine(engineDef, debug);
			}
			
			_graphics = new Sprite();
			_content = new Sprite(true);
			_camera = new Camera(this);
			
			_graphics.addChild(_content);
		}
		
		
		public override function deconstruct():void
		{
			if (_engine !== null)
			{
				_engine.deconstruct();
			}
			
			_graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		// TODO: Provide a way to pass a transition object to loadMap()?
		
		/**
		 * Loads a new Map into this World.
		 * @param map The Map to load.
		 */
		public function loadMap(map:Map):void
		{
			unloadMap();
			
			_map = map;
			_map.__construct(this);
		}
		
		
		/**
		 * Unload the current Map, if one exists. This will remove all Beings that currently exist
		 * within the World.
		 */
		public function unloadMap():void
		{
			if (_map !== null)
			{
				_map.deconstruct();
				_map = null;
			}
		}
		
		
		protected override function update():void
		{
			if (!_frozen)
			{
				_ticks ++;
				
				if (_engine !== null) _engine.step();
				if (_map !== null) _map.__update();
				
				super.update();
			}
		}
		
		
		/**
		 * Register the list of classes extending Being that are used by this game. This allows
		 * <code>Being.create()</code> to function correctly.
		 */
		protected function registerBeingTypes():Vector.<Class>
		{
			return new <Class>[
				Boundary, Region
			];
		}
		
		
		/**
		 * Adds a Being to this World.
		 * @param being The Being to add.
		 */
		public function add(being:Being):Being
		{
			if (being !== null)
			{
				if (being is IUnique)
				{
					if (!_unique.hasOwnProperty((being as IUnique).uniqueName))
					{
						_unique[(being as IUnique).uniqueName] = being;
					}
					else
					{
						throw new Error('Unique Being conflict using token "' + (being as IUnique).uniqueName + '".');
						return null;
					}
				}
			}
			
			return addT(being) as Being;
		}
		
		
		/**
		 * Removes a Being from this World.
		 * @param being The Being to remove.
		 * @param destroy Whether or not to also deconstruct the Being once removed.
		 */
		public function remove(being:Being, destroy:Boolean = false):Being
		{
			if (being !== null)
			{
				if (being is IUnique)
				{
					delete _unique[(being as IUnique).uniqueName];
				}
			}
			
			return removeT(being, destroy) as Being;
		}
		
		
		protected final override function added(thing:Thing):void
		{
			if (!(thing is GameplayState)) throw new Error("World can only be added to GameplayState.");
		}
		
		
		protected final override function removed(thing:Thing):void
		{
			if (!(thing is GameplayState)) throw new Error("World can only be removed from GameplayState.");
		}
		
		
		/**
		 * Returns a Being who implements IUnique and matches the specified unique name.
		 * @param uniqueName The <code>uniqueName</code> value of the saught IUnique Being.
		 */
		public function getUnique(uniqueName:String):Being
		{
			return _unique.hasOwnProperty(uniqueName) ? _unique[uniqueName] : null;
		}
		
		
		/**
		 * Returns a list of Beings who are of the specified type.
		 * @param type The type of Beings to get.
		 */
		public function getBeingsByType(type:Class):Vector.<Being>
		{
			var output:Vector.<Being> = new <Being>[];
			for each(var thing:Thing in children)
			{
				if (thing is type)
				{
					output.push(thing);
				}
			}
			
			return output;
		}
		
		
		public function get ui():UI { return (parent as GameplayState).ui }
		public function get engine():Engine { return _engine; }
		public function get graphics():IGraphicsContainer { return _graphics; }
		public function get mouseContainer():IGraphics{ return _content; }
		public function get camera():Camera { return _camera; }
		public function get ticks():uint { return _ticks; }
		public function get totalBeings():int { return children.length; }
		public function get map():Map { return _map; }
		
		public function get frozen():Boolean { return _frozen; }
		
		public function set frozen(value:Boolean):void
		{
			_frozen = value;
			dispatchEvent(new WorldEvent(value ? WorldEvent.FREEZE : WorldEvent.UNFREEZE));
		}
		
		internal function get __content():Sprite { return _content; }
		internal function get __children():Vector.<Thing> { return children; }
		
	}
	
}