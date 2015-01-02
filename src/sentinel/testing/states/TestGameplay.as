package sentinel.testing.states
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.gameplay.world.BaseWorld;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.BaseUI;
	
	
	public class TestGameplay extends GameplayState
	{
		
		public function TestGameplay(world:BaseWorld, ui:BaseUI)
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
		
		
		protected override function update():void
		{
			var kbd:KeyboardState = keyboard.getState();
			
			if (kbd.isDown(Keyboard.A)) world.camera.x -= 3;
			if (kbd.isDown(Keyboard.D)) world.camera.x += 3;
			if (kbd.isDown(Keyboard.W)) world.camera.y -= 3;
			if (kbd.isDown(Keyboard.S)) world.camera.y += 3;
			
			if (kbd.isDown(Keyboard.LEFT_ARROW)) world.camera.rotation -= 0.01;
			if (kbd.isDown(Keyboard.RIGHT_ARROW)) world.camera.rotation += 0.01;
			
			if (kbd.isDown(Keyboard.UP_ARROW)) world.camera.zoom += 0.01;
			if (kbd.isDown(Keyboard.DOWN_ARROW)) world.camera.zoom -= 0.01;
			
			super.update();
		}
		
		
		protected function exit():void
		{
			// Override for exit action here.
			// e.g. load the main menu state.
		}
		
	}
	
}