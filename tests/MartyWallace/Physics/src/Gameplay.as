package
{
	
	import sentinel.framework.b2.B2Debug;
	import sentinel.gameplay.environment.World;
	import sentinel.framework.b2.B2Vector2D;
	import sentinel.framework.b2.B2WorldDef;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.framework.State;
	
	
	public class Gameplay extends State
	{
		
		private var _world:World;
		private var _cooldown:int = 0;
		private var _paused:Boolean = false;
		
		
		public function Gameplay()
		{
			super();
			
			_world = add(new World(new B2WorldDef(new B2Vector2D(0, 700)), new B2Debug(game))) as World;
			
			var platform:Platform = _world.add(new Platform()) as Platform;
			
			platform.x = viewport.middleX;
			platform.y = viewport.height - 60;
			
			graphics.addChild(_world.graphics);
			
			_world.camera.x = viewport.middleX;
			_world.camera.y = viewport.middleY;
			
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
				_paused = !_paused;
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
			
			if (kbd.isDown(Keyboard.A)) _world.camera.offsetX -= 3;
			if (kbd.isDown(Keyboard.D)) _world.camera.offsetX += 3;
			if (kbd.isDown(Keyboard.W)) _world.camera.offsetY -= 3;
			if (kbd.isDown(Keyboard.S)) _world.camera.offsetY += 3;
			
			if (kbd.isDown(Keyboard.LEFT_ARROW)) _world.camera.rotation -= 0.01;
			if (kbd.isDown(Keyboard.RIGHT_ARROW)) _world.camera.rotation += 0.01;
			
			if (kbd.isDown(Keyboard.UP_ARROW)) _world.camera.zoom += 0.01;
			if (kbd.isDown(Keyboard.DOWN_ARROW)) _world.camera.zoom -= 0.01;
			
			if (!_paused)
			{
				if (--_cooldown <= 0)
				{
					_cooldown = 40;
					
					var block:Block = new Block();
					_world.add(block);
					
					block.x = Math.random() * viewport.width;
					block.y = -50;
				}
				
				super.update();
			}
		}
		
	}
	
}