package sentinel.framework {
	
	import flash.utils.getQualifiedClassName;
	import sentinel.framework.errors.FrameworkError;
	import sentinel.framework.events.EventDispatcher;
	import sentinel.framework.events.ThingEvent;
	import sentinel.framework.util.StringUtil;
	
	/**
	 * Dispatched when this Being is deconstructed.
	 * @eventType sentinel.framework.events.ThingEvent.DECONSTRUCTED
	 */
	[Event(name = 'deconstructed', type = 'sentinel.events.ThingEvent')]
	
	/**
	 * Dispatched when this Being is updated.
	 * @eventType sentinel.framework.events.ThingEvent.UPDATED
	 */
	[Event(name = 'updated', type = 'sentinel.events.ThingEvent')]
	
	/**
	 * Dispatched when this Being is added to a parent Thing.
	 * @eventType sentinel.framework.events.ThingEvent.ADDED
	 */
	[Event(name = 'added', type = 'sentinel.events.ThingEvent')]
	
	/**
	 * Dispatched when this Being is removed from a parent Thing.
	 * @eventType sentinel.framework.events.ThingEvent.REMOVED
	 */
	[Event(name = 'removed', type = 'sentinel.events.ThingEvent')]
	
	/**
	 * The core object within Sentienl.
	 * 
	 * @author Marty Wallace
	 */
	public class Thing extends EventDispatcher implements IDeconstructs, IStorable, IGameProvider {
		
		private var _id:uint = 0;
		private var _parent:Thing;
		private var _children:Vector.<Thing> = new <Thing>[];
		
		/**
		 * Constructor.
		 */
		public function Thing() {
			// Allocate an ID when constructed.
			// Could be forgotten without a super() call in an extending class.
			_id = id;
		}
		
		/**
		 * A string representation of this instance of Thing.
		 */
		public function toString():String {
			return StringUtil.toDebugString(['type', 'id'], [className, id]);
		}
		
		/**
		 * Deconstruct this Thing and its descendants.
		 */
		public override function deconstruct():void {
			removeAll(true);
			removeFromParent();
			
			_children.length = 0;
			__dispatchEvent(ThingEvent.DECONSTRUCTED);
			
			super.deconstruct();
		}
		
		/**
		 * Saves a simple representation of this Thing as an Object.
		 */
		public function save():Object {
			return { type: className };
		}
		
		/**
		 * Loads some save data obtained via <code>Thing.save()</code> and attempt to apply it to
		 * this Thing.
		 * 
		 * @param data The data to load.
		 */
		public function load(data:Object):void { }
		
		/**
		 * Update this Thing and its descendants.
		 */
		protected function update():void {
			for each (var thing:Thing in _children) {
				thing.__update();
			}
			
			__dispatchEvent(ThingEvent.UPDATED);
		}
		
		/**
		 * Add a child Thing to this Thing.
		 * 
		 * @param thing The Thing to add.
		 * 
		 * @return The Thing that was added.
		 */
		protected function addT(thing:Thing):Thing {
			if (thing === null) return null;
			
			if (thing === this) {
				throw FrameworkError.compile('You cannot add a Thing to itself.');
				return null;
			}
			
			if (thing.parent !== null) {
				if (thing.parent === this) {
					// This Thing is already the parent of the target Thing.
					return null;
				}
				
				thing.removeFromParent();
			}
			
			_children.push(thing);
			thing.__addedT(this);
			
			return thing;
		}
		
		/**
		 * Remove a child Thing from this Thing.
		 * 
		 * @param thing The Thing to remove.
		 * @param destroy Whether to also <code>deconstruct()</code> the target Thing.
		 * 
		 * @return The Thing that was removed.
		 */
		protected function removeT(thing:Thing, destroy:Boolean = false):Thing {
			if (thing === null) return null;
			
			if (thing === this) {
				// Things won't ever be added to themselves, thus can't be removed from themselves.
				return null;
			}
			
			if (thing.parent === this) {
				var index:int = _children.indexOf(thing);
				
				if (index >= 0) {
					if (index === _children.length - 1) {
						// Simply pop() if this the target is the last Thing in the list.
						_children.pop();
					} else {
						// Replace the target Thing with the last Thing.
						_children[index] = _children.pop();
					}
					
					thing.__removedT(this);
					
					if (destroy) thing.deconstruct();
				}
			}
			
			return thing;
		}
		
		/**
		 * Remove this Thing from its parent, if it has one.
		 * 
		 * @param destroy Whether to also <code>deconstruct()</code> this Thing.
		 */
		public function removeFromParent(destroy:Boolean = false):void {
			if (parent !== null) parent.__removeT(this);
			if (destroy) deconstruct();
		}
		
		/**
		 * Remove all children from this Thing.
		 * 
		 * @param destroy Whether to also <code>deconstruct()</code> all removed Things.
		 */
		public function removeAll(destroy:Boolean = false):void {
			while (_children.length > 0) {
				removeT(_children[_children.length - 1], destroy);
			}
		}
		
		/**
		 * Returns a child Thing at a given index.
		 * 
		 * @param index The index to check.
		 */
		public function getChildAt(index:int):Thing {
			if (index < 0 || index >= _children.length) return null;
			return _children[index];
		}
		
		/**
		 * Called when this Thing is added to another Thing.
		 * 
		 * @param to The Thing this Thing was added to.
		 */
		protected function addedT(to:Thing):void { }
		
		/**
		 * Called when this Thing is removed from another Thing.
		 * 
		 * @param from The Thing this Thing was removed from.
		 */
		protected function removedT(from:Thing):void { }
		
		/**
		 * Determine whether this Thing is the child of a target Thing.
		 * 
		 * @param thing The target Thing.
		 */
		public function isChildOf(thing:Thing):Boolean {
			return parent === thing;
		}
		
		/**
		 * Determine whether this Thing is the parent of the target Thing.
		 * 
		 * @param thing The target Thing.
		 */
		public function isParentOf(thing:Thing):Boolean {
			return thing.parent === this;
		}
		
		/**
		 * @private
		 * Internal alias for <code>update()</code>.
		 */
		internal function __update():void {
			update();
		}
		
		/**
		 * @private
		 * Internal alias for <code>addT()</code>.
		 */
		internal function __addT(thing:Thing):Thing {
			return addT(thing);
		}
		
		/**
		 * @private
		 * Internal alias for <code>removeT()</code>.
		 */
		internal function __removeT(thing:Thing, destroy:Boolean = false):Thing {
			return removeT(thing, destroy);
		}
		
		/**
		 * @private
		 * Internal alias for <code>addedT()</code>.
		 */
		internal function __addedT(to:Thing):void {
			_parent = to;
			__dispatchEvent(ThingEvent.ADDED);
			
			addedT(to);
		}
		
		/**
		 * @private
		 * Internal alias for <code>removedT()</code>.
		 */
		internal function __removedT(from:Thing):void {
			_parent = null;
			__dispatchEvent(ThingEvent.REMOVED);
			
			removedT(from);
		}
		
		/**
		 * @private
		 */
		internal function __dispatchEvent(type:String):void {
			if (hasEventListener(type)) {
				dispatchEvent(new ThingEvent(type));
			}
		}
		
		/** A unique ID number assigned to this Thing by the core Game class. */
		public function get id():uint {
			if (_id === 0) {
				_id = game.getUniqueId();
			}
			
			return _id;
		}
		
		/** The parent Thing, if this Thing has one. */
		public function get parent():Thing { return _parent; }
		
		/** Returns the list of child Things. */
		public function get children():Vector.<Thing> { return _children; }
		
		/** The full class name of this Thing. */
		public function get className():String { return getQualifiedClassName(this); }
		
		/** A reference to the core Game class. */
		public function get game():Game { return Game.getInstance(); }
		
	}
	
}