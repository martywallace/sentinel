package sentinel.environment
{
	
	import sentinel.framework.b2.B2Debug;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.b2.B2WorldDef;
	import sentinel.framework.graphics.ViewportAlignedContainer;
	import sentinel.framework.Thing;
	
	
	public class World extends Thing
	{
		
		private var _physics:B2World;
		private var _graphics:ViewportAlignedContainer;
		
		
		public function World(definition:B2WorldDef = null, debug:B2Debug = null)
		{
			if (definition !== null)
			{
				_physics = new B2World(definition, debug);
			}
			
			_graphics = new ViewportAlignedContainer();
		}
		
		
		public override function deconstruct():void
		{
			if (_physics !== null)
			{
				_physics.deconstruct();
			}
			
			super.deconstruct();
		}
		
		
		public override function update():void
		{
			if (_physics !== null)
			{
				_physics.update();
			}
			
			_graphics.update();
			
			super.update();
		}
		
		
		/**
		 * Adds a Being to this World.
		 * @param being The Being to add.
		 * @throws ArgumentError
		 */
		public override function add(being:Thing):void
		{
			if (being is Being)
			{
				super.add(being);
			}
			else
			{
				throw new ArgumentError("World.add() only accepts instances of Being.");
			}
		}
		
		
		/**
		 * Removes a Being from this World.
		 * @param being The Being to remove.
		 * @param destroy Whether or not to also deconstruct the Being once removed.
		 */
		public function remove(being:Thing, destroy:Boolean = false):void
		{
			if (being is Being)
			{
				super.remove(being, destroy);
			}
			else
			{
				throw new ArgumentError("World.remove() only accepts instances of Being.");
			}
		}
		
		
		public function get physics():B2World { return _physics; }
		public function get graphics():ViewportAlignedContainer { return _graphics; }
		
	}
	
}