package
{
	
	import sentinel.base.Thing;
	import sentinel.user.Keyboard;
	import sentinel.user.KeyboardState;
	import starling.core.Starling;
	import sentinel.user.MouseState;
	import sentinel.base.Game;
	

	public class TestGame extends Game
	{
		
		private var _thing:Thing;
		

		public override function initialize():void
		{
			_thing = new MyThing();
		}
		
		
		public override function update():void
		{
			_thing.update();
		}
		
	}
	
}