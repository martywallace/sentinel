package
{
	
	import sentinel.framework.graphics.TextField;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.framework.client.Keyboard;
	import sentinel.gameplay.ui.UI;
	import starling.display.DisplayObject;
	
	
	public class HUD extends UI
	{
		
		public function HUD()
		{
			super();
			
			add(new Counter());
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _keypress);
		}
		
		
		public function _keypress(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.B)
			{
				var block:Block = world.add(new Block()) as Block;
				
				block.x = Math.random() * viewport.width;
				block.y = -100;
			}
		}
		
	}
	
}