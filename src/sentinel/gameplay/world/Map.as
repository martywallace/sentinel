package sentinel.gameplay.world
{
	
	import sentinel.framework.Thing;
	import sentinel.framework.util.ObjectUtil;
	
	
	/**
	 * A Map defines a collection of Beings, events, quests, etc within a World at one time.
	 * @author Marty Wallace.
	 */
	public class Map extends Thing
	{
		
		private var _world:World;
		
		
		internal function __construct(world:World):void
		{
			_world = world;
			
			construct();
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
		
		
		public override function save():Object
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
			
			return ObjectUtil.merge(super.save(), { beings: beings });
		}
		
		
		public override function load(data:Object):void
		{
			for each(var def:Object in ObjectUtil.prop(data, 'beings', []))
			{
				if (def.hasOwnProperty('type'))
				{
					var being:Being = Being.create(def.type, def);
					_world.add(being);
				}
			}
		}
		
		
		public function get world():World { return _world; }
		
	}
	
}