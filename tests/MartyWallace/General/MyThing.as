package
{
	
	import sentinel.base.Thing;
	import sentinel.events.MouseEvent;
	import sentinel.events.KeyboardEvent;
	import sentinel.user.Keyboard;
	
	
	public class MyThing extends Thing
	{
		
		public override function construct():void
		{
			mouse.addEventListener(MouseEvent.LEFT_DOWN, _leftDown);
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _keyPressed);
			
			super.construct();
		}
		
		
		public override function deconstruct():void
		{
			mouse.removeEventListener(MouseEvent.LEFT_DOWN, _leftDown);
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _keyPressed);
			
			super.deconstruct();
		}
		
		
		private function _keyPressed(e:KeyboardEvent):void
		{
			trace(e.keyChar);
		}
		
		
		private function _leftDown(e:MouseEvent):void
		{
			trace(e.mouse.getState());
		}
		
	}
	
}