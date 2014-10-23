package
{
	
	import sentinel.base.Thing;
	import sentinel.events.MEvent;
	import sentinel.events.KEvent;
	import sentinel.user.Keyboard;
	
	
	public class MyThing extends Thing
	{
		
		public override function construct():void
		{
			mouse.addEventListener(MEvent.LEFT_DOWN, _leftDown);
			keyboard.addEventListener(KEvent.KEY_PRESSED, _keyPressed);
		}
		
		
		public override function deconstruct():void
		{
			mouse.removeEventListener(MEvent.LEFT_DOWN, _leftDown);
			keyboard.removeEventListener(KEvent.KEY_PRESSED, _keyPressed);
		}
		
		
		private function _keyPressed(e:KEvent):void
		{
			trace(e.keyChar);
		}
		
		
		private function _leftDown(e:MEvent):void
		{
			trace(e.mouse.getState());
		}
		
	}
	
}