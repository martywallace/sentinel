package
{
	
	import beings.Block;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.gameplay.ui.UI;
	import sentinel.gameplay.scene.Being;
	
	
	public class HUD extends UI
	{
		
		private var _block:Block;
		
		
		public function HUD()
		{
			super();
			
			add(new Counter());
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _keypress);
		}
		
		
		public override function deconstruct():void
		{
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _keypress);
			
			super.deconstruct();
		}
		
		
		public function _keypress(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.B)
			{
				world.add(Being.create('beings::Block', { x: Math.random() * viewport.width, y: -100 }));
			}
		}
		
	}
	
}