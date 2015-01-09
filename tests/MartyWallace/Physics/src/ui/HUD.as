package ui
{
	
	import sentinel.gameplay.ui.BaseUI;
	
	
	public class HUD extends BaseUI
	{	
		
		public function HUD()
		{
			super();
			add(new Counter());
		}
		
	}
	
}