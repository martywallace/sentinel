package
{
	
	import sentinel.environment.World;
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
			
			_world = add(new World(new B2WorldDef(new B2Vector2D(0, 700)))) as World;
			
			var platform:Platform = _world.add(new Platform()) as Platform;
			
			platform.body.x = viewport.middleX;
			platform.body.y = viewport.height - 60;
			
			graphics.addChild(_world.graphics);
			
			_world.camera.x = viewport.middleX;
			_world.camera.y = viewport.middleY;
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _togglePause);
		}
		
		
		public override function deconstruct():void
		{
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _togglePause);
			
			super.deconstruct();
		}
		
		
		private function _togglePause(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.P)
			{
				_paused = !_paused;
			}
		}
		
		
		public override function update():void
		{
			var kbd:KeyboardState = keyboard.getState();
			
			if (kbd.isDown(Keyboard.ESC))
			{
				game.loadState(new Menu());
			}
			
			if (kbd.isDown(Keyboard.A)) _world.camera.x -= 3;
			if (kbd.isDown(Keyboard.D)) _world.camera.x += 3;
			if (kbd.isDown(Keyboard.W)) _world.camera.y -= 3;
			if (kbd.isDown(Keyboard.S)) _world.camera.y += 3;
			
			if (kbd.isDown(Keyboard.LEFT_ARROW)) _world.camera.rotation -= 0.01;
			if (kbd.isDown(Keyboard.RIGHT_ARROW)) _world.camera.rotation += 0.01;
			
			if (kbd.isDown(Keyboard.UP_ARROW)) _world.camera.scale += 0.01;
			if (kbd.isDown(Keyboard.DOWN_ARROW)) _world.camera.scale -= 0.01;
			
			if (!_paused)
			{
				if (--_cooldown <= 0)
				{
					_cooldown = 2;
					
					var block:Block = new Block();
					_world.add(block);
					
					block.body.x = Math.random() * viewport.width;
					block.body.y = -50;
				}
				
				super.update();
			}
		}
		
	}
	
}