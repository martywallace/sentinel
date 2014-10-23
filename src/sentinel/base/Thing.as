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
			dispatchEvent(new ThingEvent(ThingEvent.CONSTRUCTED));
		}
		
		
		public function update():void
		{
			for each(var thing:IUpdates in _children) thing.update();
			
			dispatchEvent(new ThingEvent(ThingEvent.UPDATED));
		}
		
		
		public function deconstruct():void
		{
			for each(var thing:IDeconstructs in _children) thing.deconstruct();
			
			dispatchEvent(new ThingEvent(ThingEvent.DECONSTRUCTED));
		}
		
		
		public function add(thing:Thing):void
		{
			//
		}
		
		
		public function remove(thing:Thing):void
		{
			//
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