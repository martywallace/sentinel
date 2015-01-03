package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	import sentinel.framework.Thing;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * A Map defines a collection of Beings, events, quests, etc within a World at one time.
	 * @author Marty Wallace.
	 */
	public class BaseMap extends Thing
	{
		
		private var _world:BaseWorld;
		
		
		internal function __construct(world:BaseWorld):void
		{
			_world = world;
			
			construct();
		}
		
		
		/**
		 * Alias for <code>world.add()</code>.
		 * @param being The Being to add to the World associated with this Map.
		 */
		public function add(being:Being):Being
		{
			return _world.add(being);
		}
		
		
		/**
		 * Alias for <code>world.remove()</code>.
		 * @param being The Being to remove from the World associated with this Map.
		 * @param destroy Whether or not to deconstruct the target Being after removal.
		 */
		public function remove(being:Being, destroy:Boolean = false):Being
		{
			return _world.remove(being, destroy);
		}
		
		
		protected function construct():void
		{
			//
		}
		
		
		public override function deconstruct():void
		{
			_world.removeAll();
			
			super.deconstruct();
		}
		
		
		public override function save():Data
		{
			var beings:Array = [];
			
			for each(var thing:Thing in _world.__children)
			{
				if (thing is Being)
				{
					var data:Object = thing.save();
					
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
		
		
		public override function load(data:Data):void
		{
			for each(var def:Object in data.get('beings', []))
			{
				if (def.hasOwnProperty('type'))
				{
					var being:Being = Being.create(def.type, Data.create(def));
					_world.add(being);
				}
			}
		}
		
		
		/**
		 * Grant access to <code>update()</code> within <code>sentinel.gameplay.world</code>.
		 */
		internal function __update():void
		{
			update();
		}
		
		
		public function get world():BaseWorld { return _world; }
		
	}
	
}