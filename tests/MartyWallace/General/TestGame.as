package
{
	
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
			
			if (mouseState.available && !mouseState.equals(_oldMouseState))
			{
				trace(mouseState);
			}
			
			_oldMouseState = mouse.getState();
		}
		
	}
	
}