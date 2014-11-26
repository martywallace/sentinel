package sentinel.testing.states
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.UI;
	
	
	public class TestGameplay extends GameplayState
	{
		
		public function TestGameplay(world:World, ui:UI)
		{
			super(world, ui);
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _keyPress);
		}
		
		
		public override function deconstruct():void
		{
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _keyPress);
			
			super.deconstruct();
		}
		
		
		private function _keyPress(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.Q)
			{
				exit();
			}
			
			if (event.keyCode === Keyboard.P)
			{
				world.frozen = !world.frozen;
			}
		}
		
		
		protected function exit():void
		{
			// Override for exit action here.
			// e.g. load the main menu state.
		}
		
	}
	
}