package
{
	
	import sentinel.framework.Game;
	
	
	public class BotBattle extends Game
	{
		
		public override function construct():void
		{
			loadState(new Battle());
		}
		
	}
	
}