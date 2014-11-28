package states
{
	
	import scene.Maze;
	import sentinel.gameplay.ui.UI;
	import sentinel.testing.states.TestGameplay;
	
	
	public class Gameplay extends TestGameplay
	{
		
		public function Gameplay()
		{
			super(new Maze(true), new UI());
			
			//
		}
		
		
		
		protected override function exit():void
		{
			game.loadState(new Menu());
		}
		
	}
	
}