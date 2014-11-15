package
{
	import sentinel.framework.Game;
	
	public class ETest extends Game
	{
		
		public override function construct():void
		{
			trace('working');
			
			loadState(new Gameplay());
		}
		
	}
	
}