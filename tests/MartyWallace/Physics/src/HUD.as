package
{
	
	import sentinel.framework.graphics.TextField;
	import sentinel.gameplay.ui.UI;
	import starling.display.DisplayObject;
	
	
	public class HUD extends UI
	{
		
		public function HUD()
		{
			super();
			
			add(new Counter());
		}
		
	}
	
}