package
{
	
	import sentinel.user.Keyboard;
	import sentinel.user.KeyboardState;
	import starling.core.Starling;
	import sentinel.user.MouseState;
	import sentinel.base.Game;
	

	public class TestGame extends Game
	{
		
		private var _oldMouseState:MouseState;
		

		public override function initialize():void
		{
			var t:MyThing = new MyThing();
			_oldMouseState = mouse.getState();
		}
		
		
		public override function update():void
		{
			var mouseState:MouseState = mouse.getState();
			var keyboardState:KeyboardState = keyboard.getState();
			
			if (mouseState.available && !mouseState.equals(_oldMouseState))
			{
				trace(mouseState);
			}
			
			trace(keyboardState.keyIsDown(Keyboard.A));
			
			_oldMouseState = mouse.getState();
		}
		
	}
	
}