package
{
	
	import sentinel.testing.TestGame;
	
	
	public class BotBattle extends TestGame
	{
		
		protected override function construct():void
		{
			super.construct();
			
			loadState(new Menu());
		}
		
	}
	
}