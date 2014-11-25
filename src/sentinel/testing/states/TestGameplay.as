package sentinel.testing.states
{
	
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.UI;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.events.KeyboardEvent;
	
	
	public class TestGameplay extends GameplayState
	{
		
		public function TestGameplay(world:World, ui:UI)
		{
			super(world, ui);
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _keyPress);
		}
		
		
		private function _keyPress(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.ESC)
			{
				exit();
			}
		}
		
		
		protected function exit():void
		{
			//
		}
		
	}
	
}