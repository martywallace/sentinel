package sentinel.framework
{
	
	import sentinel.framework.events.ThingEvent;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.Mouse;
	import sentinel.framework.client.Viewport;
	import starling.core.Starling;
	import starling.events.EventDispatcher;
	
	
	/**
	 * The core object within Sentienl, a Thing is able to access all of the core game components.
	 * Things are also able to be added to parent Things and contain their own children Things.
	 * @author Marty Wallace.
	 */
	public class Thing extends EventDispatcher implements IUpdates, IDeconstructs
	{
		
		private var _parent:Thing;
		private var _children:Vector.<Thing> = new <Thing>[];
		
		
		/**
		 * Update this Thing and its descendants.
		 */
		public function update():void
		{
			for each(var thing:IUpdates in _children)
			{
				thing.update();
			}
			
			_dispatchEvent(ThingEvent.UPDATED);
		}
		
		
		/**
		 * Deconstruct this Thing and its descendants.
		 */
		public function deconstruct():void
		{
			for each(var thing:IDeconstructs in _children)
			{
				thing.deconstruct();
			}
			
			removeFromParent();
			removeEventListeners();
			
			_children.length = 0;
			_dispatchEvent(ThingEvent.DECONSTRUCTED);
		}
		
		
		/**
		 * Add a child Thing to this Thing.
		 * @param thing The Thing to add.
		 * @return The Thing that was added.
		 */
		public function add(thing:Thing):Thing
		{
			if (thing === this)
			{
				// Cannot add Things to themselves.
				return null;
			}
			
			if (thing.parent !== null)
			{
				if (thing.parent === this)
				{
					// This Thing is already the parent of the target Thing.
					return null;
				}
				
				thing.removeFromParent();
			}
			
			_children.push(thing);
			thing.__added(this);
			
			return thing;
		}
		
		
		/**
		 * Remove a child Thing from this Thing.
		 * @param thing The Thing to remove.
		 * @param destroy Whether to also <code>deconstruct()</code> the target Thing.
		 * @return The Thing that was removed.
		 */
		public function remove(thing:Thing, destroy:Boolean = false):Thing
		{
			if (thing === this)
			{
				// Things won't ever be added to themselves, thus can't be removed from themselves.
				return null;
			}
			
			if (thing.parent === this)
			{
				var index:int = _children.indexOf(thing);
				
				if (index >= 0)
				{
					if (index === _children.length - 1)
					{
						// Simply pop() if this the target is the last Thing in the list.
						_children.pop();
					}
					else
					{
						// Replace the target Thing with the last Thing.
						_children[index] = _children.pop();
					}
					
					
					thing.__removed(this);
					
					if (destroy) thing.deconstruct();
				}
			}
			
			return thing;
		}
		
		
		/**
		 * Remove this Thing from its parent, if it has one.
		 * @param destroy Whether to also <code>deconstruct()</code> this Thing.
		 */
		public function removeFromParent(destroy:Boolean = false):void
		{
			if (parent !== null) parent.remove(this);
			if (destroy) deconstruct();
		}
		
		
		/**
		 * Remove all children from this Thing.
		 * @param destroy Whether to also <code>deconstruct()</code> all removed Things.
		 */
		public function removeAll(destroy:Boolean = false):void
		{
			while (_children.length > 0)
			{
				remove(_children[_children.length - 1], destroy);
			}
		}
		
		
		/**
		 * Returns a child Thing at a given index.
		 * @param index The index to check.
		 */
		public function getChildAt(index:int):Thing
		{
			if (index < 0 || index >= _children.length) return null;
			return _children[index];
		}
		
		
		internal function __added(to:Thing):void
		{
			_parent = to;
			_dispatchEvent(ThingEvent.ADDED);
			
			added(to);
		}
		
		
		/**
		 * Called when this Thing is added to another Thing.
		 * @param to The Thing this Thing was added to.
		 */
		protected function added(to:Thing):void
		{
			//
		}
		
		
		internal function __removed(from:Thing):void
		{
			_parent = null;
			_dispatchEvent(ThingEvent.REMOVED);
			
			removed(from);
		}
		
		
		/**
		 * Called when this Thing is removed from another Thing.
		 * @param from The Thing this Thing was removed from.
		 */
		protected function removed(from:Thing):void
		{
			//
		}
		
		
		private function _dispatchEvent(type:String):void
		{
			if (hasEventListener(type))
			{
				dispatchEvent(new ThingEvent(type));
			}
		}
		
		
		/**
		 * A reference to the core Game class.
		 */
		protected function get game():Game { return Starling.current.root as Game; }
		
		/**
		 * A reference to the game Viewport class.
		 */
		protected function get viewport():Viewport { return game.viewport; }
		
		/**
		 * A reference to the game Mouse class.
		 */
		protected function get mouse():Mouse { return game.mouse; }
		
		/**
		 * A reference to the game Keyboard class.
		 */
		protected function get keyboard():Keyboard { return game.keyboard; }
		
		/**
		 * A reference to the game Library class.
		 */
		protected function get library():Library { return game.library; }
		
		/**
		 * The parent Thing, if this Thing has one.
		 */
		public function get parent():Thing { return _parent; }
		
		/**
		 * Returns the list of child Things.
		 * This is the <em>actual list</em> - be very careful what you do with it.
		 */
		public function get children():Vector.<Thing> { return _children; }
		
	}
	
}