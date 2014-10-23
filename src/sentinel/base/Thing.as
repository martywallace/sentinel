package sentinel.base
{
	
	import sentinel.contracts.IConstructs;
	import sentinel.contracts.IUpdates;
	import sentinel.contracts.IDeconstructs;
	import sentinel.user.Viewport;
	import sentinel.user.Mouse;
	import sentinel.user.Keyboard;
	import sentinel.events.ThingEvent;
	
	import starling.core.Starling;
	import starling.events.EventDispatcher;
	
	
	public class Thing extends EventDispatcher implements IConstructs, IUpdates, IDeconstructs
	{
		
		private var _children:Vector.<Thing> = new <Thing>[];
		private var _parent:Thing;
		
		
		public function Thing()
		{
			construct();
		}
		
		
		public function construct():void
		{
			_dispatchEvent(ThingEvent.CONSTRUCTED);
		}
		
		
		public function update():void
		{
			for each(var thing:IUpdates in _children)
			{
				thing.update();
			}
			
			_dispatchEvent(ThingEvent.UPDATED);
		}
		
		
		public function deconstruct():void
		{
			for each(var thing:IDeconstructs in _children)
			{
				thing.deconstruct();
			}
			
			_dispatchEvent(ThingEvent.DECONSTRUCTED);
			
			removeFromParent();
			removeEventListeners();
		}
		
		
		public function add(thing:Thing):void
		{
			if (thing === this) return;
			
			if (thing.parent !== null)
			{
				if (thing.parent === this) return;
				
				thing.parent.remove(thing);
			}
			
			_children.push(thing);
			thing.__added(this);
		}
		
		
		public function remove(thing:Thing):void
		{
			if (thing === this) return;
			
			if (thing.parent === this)
			{
				var index:int = _children.indexOf(thing);
				
				if (index >= 0) _children.splice(index, 1);
				
				thing.__removed(this);
			}
		}
		
		
		public function removeFromParent():void
		{
			if (parent !== null) parent.remove(this);
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
		
		
		public function get game():Game{ return Starling.current.root as Game; }
		public function get viewport():Viewport{ return game.viewport; }
		public function get mouse():Mouse{ return game.mouse; }
		public function get keyboard():Keyboard{ return game.keyboard; }
		public function get starling():Starling { return Starling.current; }
		public function get parent():Thing { return _parent; }
		public function get numChildren():int { return _children.length; }
		
	}
	
}