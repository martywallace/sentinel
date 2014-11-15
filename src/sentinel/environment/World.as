package sentinel.environment
{
	
	import sentinel.framework.b2.B2Debug;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.b2.B2WorldDef;
	import sentinel.framework.events.ThingEvent;
	import sentinel.framework.graphics.ViewportAlignedContainer;
	import sentinel.framework.Thing;
	import starling.display.DisplayObject;
	
	
	public class World extends Thing
	{
		
		private var _physics:B2World;
		private var _graphics:ViewportAlignedContainer;
		private var _camera:Camera;
		
		
		public function World(definition:B2WorldDef = null, debug:B2Debug = null)
		{
			if (definition !== null)
			{
				_physics = new B2World(definition, debug);
			}
			
			_graphics = new ViewportAlignedContainer();
			_camera = new Camera(this);
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
			if (_physics !== null)
			{
				_physics.update();
				
				if (_physics.debug !== null)
				{
					_physics.debug.wrapper.x = _graphics.alignedX;
					_physics.debug.wrapper.y = _graphics.alignedY;
					_physics.debug.wrapper.scaleX = _graphics.scaleX;
					_physics.debug.wrapper.scaleY = _graphics.scaleY;
					_physics.debug.wrapper.rotation = _graphics.rotation * 180 / Math.PI;
				}
			}
			
			_graphics.update();
			
			super.update();
		}
		
		
		/**
		 * Adds a Being to this World.
		 * @param being The Being to add.
		 * @throws ArgumentError
		 */
		public override function add(being:Thing):Thing
		{
			if (being is Being)
			{
				super.add(being);
				
				if ((being as Being).graphics !== null)
				{
					_graphics.content.addChild((being as Being).graphics as DisplayObject);
					(being as Being).alignGraphicsToBody();
				}
				
				return being;
			}
			else
			{
				throw new ArgumentError("World.add() only accepts instances of Being.");
			}
			
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
			if (being is Being)
			{
				return super.remove(being, destroy);
			}
			else
			{
				throw new ArgumentError("World.remove() only accepts instances of Being.");
			}
			
			return null;
		}
		
		
		/**
		 * Returns the list of Beings within this world.
		 * Note: This returns a <em>copy</em> of the internally handled list.
		 */
		public function get beings():Vector.<Being>
		{
			var output:Vector.<Being> = new <Being>[];
			
			for each(var being:Thing in _children)
			{
				output.push(being as Being);
			}
			
			return output;
		}
		
		
		public function get physics():B2World { return _physics; }
		public function get graphics():ViewportAlignedContainer { return _graphics; }
		public function get camera():Camera { return _camera; }
		
	}
	
}