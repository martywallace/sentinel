package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.IMouseDataProvider;
	import sentinel.framework.IServiceable;
	import sentinel.framework.Service;
	import sentinel.framework.ServiceManager;
	import sentinel.framework.Thing;
	import sentinel.gameplay.events.WorldEvent;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.BaseUI;
	
	
	/**
	 * The World is the core class for dealing with collections of Beings and the interactions
	 * between those Beings. The World also deals with initializing a physics engine, if required.
	 * @author Marty Wallace.
	 */
	public class BaseWorld extends Thing implements IMouseDataProvider, IServiceable
	{
		
		private var _engine:Engine;
		private var _camera:Camera;
		private var _frozen:Boolean = false;
		private var _graphics:IGraphicsContainer;
		private var _content:Sprite;
		private var _ticks:uint = 0;
		private var _unique:Data;
		private var _groups:Data;
		private var _services:ServiceManager;
		private var _map:BaseMap;
		
		
		/**
		 * Constructor.
		 * @param engineDef An EngineDef describing the physics engine.
		 * @param debug A Debug instance describing the type of debugging to use.
		 */
		public function BaseWorld(engineDef:EngineDef = null, debug:Debug = null)
		{
			if (engineDef !== null)
			{
				_engine = new Engine(engineDef, debug);
			}
			
			_graphics = new Sprite();
			_content = new Sprite(true);
			_camera = new Camera(this);
			
			_unique = new Data();
			_groups = new Data();
			
			_services = new ServiceManager(this);
			_services.setServices(Vector.<Service>(defineServices()));
			
			_graphics.addChild(_content);
		}
		
		
		/**
		 * Deconstruct this World and all the Beings within it.
		 */
		public override function deconstruct():void
		{
			if (_engine !== null)
			{
				_engine.deconstruct();
			}
			
			_graphics.deconstruct();
			_services.deconstruct();
			
			super.deconstruct();
		}
		
		
		// TODO: Provide a way to pass a transition object to loadMap()?
		
		/**
		 * Loads a new Map into this World.
		 * @param map The Map to load.
		 */
		public function loadMap(map:BaseMap):void
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
				
				_services.update();
				
				super.update();
			}
		}
		
		
		/**
		 * Returns a list of services to attach to this World.
		 */
		protected function defineServices():Vector.<WorldService>
		{
			return null;
		}
		
		
		/**
		 * Register the list of classes extending Being that are used by this game. This allows
		 * <code>Being.create()</code> to function correctly.
		 */
		protected function registerBeingTypes():Vector.<Class>
		{
			return new <Class>[
				Boundary, BoundaryBox, Region
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
					var unique:IUnique = being as IUnique;
					
					if (!_unique.has(unique.uniqueName))
					{
						_unique.set(unique.uniqueName, being);
					}
					else
					{
						throw new Error('Unique Being conflict using uniqueName "' + unique.uniqueName + '".');
						return null;
					}
				}
				
				if (being is IGroupable)
				{
					var groupable:IGroupable = being as IGroupable;
					
					if (!_groups.has(groupable.groupName))
					{
						// Create the group.
						_groups.set(groupable.groupName, { });
					}
					
					if (!_groups.get(groupable.groupName).hasOwnProperty(groupable.nameInGroup))
					{
						_groups.get(groupable.groupName)[groupable.nameInGroup] = being;
					}
					else
					{
						throw new Error('Groupable Being conflict in group "' + groupable.groupName + '" using nameInGroup "' + groupable.nameInGroup + '".');
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
					_unique.del((being as IUnique).uniqueName);
				}
				
				if (being is IGroupable)
				{
					var groupable:IGroupable = being as IGroupable;
					
					if (_groups.hasOwnProperty(groupable.groupName))
					{
						delete _groups.get(groupable.groupName)[groupable.nameInGroup];
					}
				}
			}
			
			return removeT(being, destroy) as Being;
		}
		
		
		/**
		 * Returns a Being who implements IUnique and matches the specified unique name.
		 * @param uniqueName The <code>uniqueName</code> value of the saught IUnique Being.
		 */
		public function getUnique(uniqueName:String):Being
		{
			return _unique.get(uniqueName);
		}
		
		
		/**
		 * Returns a list of Beings who belong to the specified group.
		 * @param groupName The group name.
		 */
		public function getGroup(groupName:String):Vector.<Being>
		{
			var result:Vector.<Being> = new <Being>[];
			
			for (var nameInGroup:String in _groups.get(groupName, { }))
			{
				result.push(_groups[groupName][nameInGroup]);
			}
			
			return result;
		}
		
		
		/**
		 * Returns a single Being from the specified group with a given name within that group.
		 * @param groupName The group name.
		 * @param nameInGroup The name of the Being within the group.
		 */
		public function getFromGroup(groupName:String, nameInGroup:String):Being
		{
			if (_groups.get(groupName) !== null && _groups.get(groupName).hasOwnProperty(nameInGroup))
			{
				return _groups.get(groupName)[nameInGroup];
			}
			
			return null;
		}
		
		
		/**
		 * Queries the World for a collection of Beings meeting a given criteria. The result Beings
		 * are contained within a <code>WorldQueryResult</code>, which provides additional information
		 * about the query made.
		 * @param query The query to use.
		 */
		public function query(query:Query):Vector.<WorldQueryResult>
		{
			return query.__execute(this);
		}
		
		
		/**
		 * Returns a WorldService with the specified name.
		 * @param name The name of the WorldService to find.
		 */
		protected function getService(name:String):WorldService
		{
			return _services.getService(name) as WorldService;
		}
		
		
		protected final override function addedT(thing:Thing):void
		{
			if ((thing is GameplayState)) removed(thing as GameplayState);
			else throw new Error("World can only be added to GameplayState.");
		}
		
		
		protected function added(to:GameplayState):void
		{
			//
		}
		
		
		protected final override function removedT(thing:Thing):void
		{
			if ((thing is GameplayState)) removed(thing as GameplayState);
			else throw new Error("World can only be removed from GameplayState.");
		}
		
		
		protected function removed(from:GameplayState):void
		{
			//
		}
		
		
		public function get ui():BaseUI { return (parent as GameplayState).ui }
		public function get engine():Engine { return _engine; }
		public function get graphics():IGraphicsContainer { return _graphics; }
		public function get mouseContainer():IGraphics{ return _content; }
		public function get camera():Camera { return _camera; }
		public function get ticks():uint { return _ticks; }
		public function get totalBeings():int { return children.length; }
		public function get map():BaseMap { return _map; }
		
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