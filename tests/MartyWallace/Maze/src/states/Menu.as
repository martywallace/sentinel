package states
{
	
	import sentinel.testing.states.TestMenu;
	import sentinel.testing.ui.TestMenuButton;
	
	
	public class Menu extends TestMenu
	{
		
		public function Menu()
		{
			super();
			
			if (storage.load('hero') !== null)
			{
				setButtons(new <TestMenuButton>[
					new TestMenuButton('New', _click),
					new TestMenuButton('Continue', _click)
				]);
			}
			else
			{
				setButtons(new <TestMenuButton>[
					new TestMenuButton('Play', _click)
				]);
			}
		}
		
		
		private function _click(button:TestMenuButton):void
		{
			if (button.text === 'Play')
			{
				game.loadState(new Gameplay());
			}
			
			if (button.text === 'New')
			{
				storage.empty();
				game.loadState(new Gameplay());
			}
			
			if (button.text === 'Continue')
			{
				var gameplay:Gameplay = new Gameplay();
				gameplay.world.getUnique('hero').load(storage.load('hero'));
				
				game.loadState(gameplay);
			}
		}
		
	}
	
}