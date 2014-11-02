package sentinel.base
{
	
	import sentinel.contracts.IUpdates;
	import sentinel.contracts.IDeconstructs;
	import sentinel.user.Viewport;
	import sentinel.user.Mouse;
	import sentinel.user.Keyboard;
	import sentinel.events.ThingEvent;
	import starling.core.Starling;
	import starling.events.EventDispatcher;
	
	
	/**
	 * The core object within Sentienl, a Thing is able to access all of the core game components. Things are also able to be added to parent Things and contain their own children Things.
	 *
	 * @author Marty Wallace.
	 */
	public class Thing extends EventDispatcher implements IUpdates, IDeconstructs
	{
		
		private var _parent:Thing;
		private var _children:Vector.<Thing> = new <Thing>[];
		
		
		public function Thing()
		{
			// Constructor.
		}
		
		
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
		 */
		public function add(thing:Thing):void
		{
			if (thing === this)
			{
				// Cannot add Things to themselves.
				return;
			}
			
			if (thing.parent !== null)
			{
				if (thing.parent === this)
				{
					// This Thing is already the parent of the target Thing.
					return;
				}
				
				thing.removeFromParent();
			}
			
			_children.push(thing);
			thing.__added(this);
		}
		
		
		/**
		 * Remove a child Thing from this Thing.
		 * @param thing The Thing to remove.
		 * @param destroy Whether to also <code>deconstruct()</code> the target Thing.
		 */
		public function remove(thing:Thing, destroy:Boolean = false):void
		{
			if (thing === this)
			{
				// Things won't ever be added to themselves, thus can't be removed from themselves.
				return;
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
		
		
		protected function removed(from:Thing):void
		{
			//
		}
		
		
		private function _dispatchEvent(type:String):void
		{
			if (hasEventListener(type))
				dispatchEvent(new ThingEvent(type));
		}
		
		
		/**
		 * A reference to the core Game class.
		 */
		public function get game():Game { return Starling.current.root as Game; }
		
		/**
		 * A reference to the game Viewport class.
		 */
		public function get viewport():Viewport { return game.viewport; }
		
		/**
		 * A reference to the game Mouse class.
		 */
		public function get mouse():Mouse { return game.mouse; }
		
		/**
		 * A reference to the game Keyboard class.
		 */
		public function get keyboard():Keyboard { return game.keyboard; }
		
		/**
		 * The parent Thing, if this Thing has one.
		 */
		public function get parent():Thing { return _parent; }
		
		/**
		 * Returns the list of child Things.
		 * Note: The returned Vector is a <em>copy</em> of the internally handled list.
		 */
		public function get children():Vector.<Thing> { return _children.slice(); }
		
		/**
		 * The number of children Things added to this Thing.
		 */
		public function get numChildren():int { return _children.length; }
		
	}
	
}