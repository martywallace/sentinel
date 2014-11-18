package
{
	
	import sentinel.framework.b2.B2Debug;
	import sentinel.framework.b2.B2Vector2D;
	import sentinel.framework.b2.B2WorldDef;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	
	
	public class Gameplay extends GameplayState
	{
		
		private var _cooldown:int = 0;
		private var _platform:Platform;
		
		
		public function Gameplay()
		{
			super(new World(new B2WorldDef(new B2Vector2D(0, 1400)), new B2Debug(game, 1, 0.5, 0, new <int>[B2Debug.SHAPE, B2Debug.CENTER_OF_MASS])), new HUD());
			
			_platform = world.add(new Platform()) as Platform;
			
			_platform.x = viewport.middleX;
			_platform.y = viewport.height - 60;
			
			world.camera.x = viewport.middleX;
			world.camera.y = viewport.middleY;
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _togglePause);
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _quit);
		}
		
		
		public override function deconstruct():void
		{
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _togglePause);
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _quit);
			
			super.deconstruct();
		}
		
		
		private function _togglePause(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.P)
			{
				world.frozen = !world.frozen;
			}
		}
		
		
		private function _quit(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.ESC)
			{
				game.loadState(new Menu());
			}
		}
		
		
		public override function update():void
		{
			var kbd:KeyboardState = keyboard.getState();
			
			if (kbd.isDown(Keyboard.A)) world.camera.x -= 3;
			if (kbd.isDown(Keyboard.D)) world.camera.x += 3;
			if (kbd.isDown(Keyboard.W)) world.camera.y -= 3;
			if (kbd.isDown(Keyboard.S)) world.camera.y += 3;
			
			if (kbd.isDown(Keyboard.SPACEBAR)) world.camera.lookAt(_platform);
			
			if (kbd.isDown(Keyboard.LEFT_ARROW)) world.camera.rotation -= 0.01;
			if (kbd.isDown(Keyboard.RIGHT_ARROW)) world.camera.rotation += 0.01;
			
			if (kbd.isDown(Keyboard.UP_ARROW)) world.camera.zoom += 0.01;
			if (kbd.isDown(Keyboard.DOWN_ARROW)) world.camera.zoom -= 0.01;
			
			super.update();
		}
		
	}
	
}