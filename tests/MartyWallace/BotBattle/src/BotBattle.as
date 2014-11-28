package
{
	
	import sentinel.testing.TestGame;
	
	
	public class BotBattle extends TestGame
	{
		
		public override function construct():void
		{
			super.construct();
			
			loadState(new Menu());
		}
		
	}
	
}