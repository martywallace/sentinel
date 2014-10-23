package
{
	
	import sentinel.base.Thing;
	import sentinel.events.ThingEvent;
	import sentinel.user.Keyboard;
	import sentinel.user.KeyboardState;
	import starling.core.Starling;
	import sentinel.user.MouseState;
	import sentinel.base.Game;
	

	public class TestGame extends Game
	{
		
		private var _thing:Thing;
		

		public override function construct():void
		{
			_thing = new MyThing();
			
			var innerThing:InnerThing = new InnerThing();
			var t:Thing = new Thing();
			
			_thing.add(t);
			_thing.add(innerThing);
			innerThing.add(t);
			
			t.addEventListener(ThingEvent.DECONSTRUCTED, _innerDecon);
			
			trace(t.parent);
			
			_thing.deconstruct();
		}
		
		
		private function _innerDecon(event:ThingEvent):void
		{
			trace('deconstruct chain working');
		}
		
		
		public override function update():void
		{
			_thing.update();
		}
		
	}
	
}