package
{
	
	import sentinel.testing.states.TestMenu;
	import sentinel.testing.ui.TestMenuButton;
	
	
	public class Menu extends TestMenu
	{
		
		public function Menu()
		{
			super();
			
			setButtons(new <TestMenuButton>[
				new TestMenuButton('Play', _menuButton)
			]);
		}
		
		
		private function _menuButton(button:TestMenuButton):void
		{
			if (button.text === 'Play')
			{
				game.loadState(new Gameplay());
			}
		}
		
	}
	
}