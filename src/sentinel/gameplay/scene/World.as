package sentinel.gameplay.scene
{
	
	import sentinel.framework.Data;
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.Thing;
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
	public class World extends Thing
	{
		
		private var _engine:Engine;
		private var _camera:Camera;
		private var _frozen:Boolean = false;
		private var _graphics:IGraphicsContainer;
		private var _content:Sprite;
		private var _ticks:uint = 0;
		private var _unique:Object = { };
		
		
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
			_content = new Sprite();
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
		
		
		public override function save():Data
		{
			var beings:Array = [];
			
			for each(var thing:Thing in children)
			{
				if (thing is Being)
				{
					var data:Data = thing.save();
					
					if (data !== null)
					{
						// Only save objects who return actual data for save(). This provides the
						// opportunity to return null from save() on Beings that shouldn't be added
						// to the save data e.g. particles, effects, bullets, etc.
						beings.push(data);
					}
				}
			}
			
			return super.save().merge({ beings: beings });
		}
		
		
		public override function load(data:Object):void
		{
			super.load(data);
			
			if (data.hasOwnProperty('beings'))
			{
				for each(var def:Object in data.beings)
				{
					if (def.hasOwnProperty('type'))
					{
						var being:Being = Being.create(def.type, def);
						add(being);
					}
				}
			}
		}
		
		
		protected override function update():void
		{
			if (!_frozen)
			{
				_ticks ++;
				
				if (_engine !== null) _engine.step();
				
				super.update();
			}
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
					if (!_unique.hasOwnProperty((being as IUnique).token))
					{
						_unique[(being as IUnique).token] = being;
					}
					else
					{
						throw new Error('Unique Being conflict using token "' + (being as IUnique).token + '".');
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
					delete _unique[(being as IUnique).token];
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
		 * Returns a Being who implements IUnique and matches the specified token.
		 * @param token The <code>token</code> value of the saught IUnique Being.
		 */
		public function getUnique(token:String):Being
		{
			return _unique.hasOwnProperty(token) ? _unique[token] : null;
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
		public function get camera():Camera { return _camera; }
		public function get frozen():Boolean { return _frozen; }
		public function set frozen(value:Boolean):void { _frozen = value; }
		public function get ticks():uint { return _ticks; }
		public function get totalBeings():int { return children.length; }
		
		internal function get __content():Sprite { return _content; }
		
	}
	
}