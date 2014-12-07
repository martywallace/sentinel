package ui
{
	
	import sentinel.gameplay.ui.UI;
	
	
	public class HUD extends UI
	{	
		
		public function HUD()
		{
			super();
			add(new Counter());
		}
		
	}
	
}