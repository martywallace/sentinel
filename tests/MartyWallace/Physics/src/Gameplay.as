package
{
	
	import beings.Platform;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.scene.Boundary;
	import sentinel.gameplay.scene.World;
	import sentinel.testing.states.TestGameplay;
	
	
	public class Gameplay extends TestGameplay
	{
		
		private var _platform:Platform;
		private var _boundary:Boundary;
		
		private var _cooldown:int = 0;
		
		
		public function Gameplay()
		{
			super(
				new World(
					new EngineDef(new Vector2D(0, 1400)),
					new Debug(game, 1, 0.5, 0, new <int>[Debug.SHAPE, Debug.CENTER_OF_MASS])
				),
				new HUD()
			);
			
			if (storage.load('world') !== null)
			{
				world.load(storage.load('world'));
			}
			else
			{
				var platform:Platform = new Platform();
				platform.moveTo(viewport.center.x, viewport.height - 60);
				
				world.add(platform);
			}
			
			world.camera.x = viewport.center.x;
			world.camera.y = viewport.center.y;
		}
		
		
		protected override function exit():void
		{
			game.loadState(new Menu());
		}
		
		
		protected override function update():void
		{
			var kbd:KeyboardState = keyboard.getState();
			
			if (kbd.isDown(Keyboard.A)) world.camera.x -= 3;
			if (kbd.isDown(Keyboard.D)) world.camera.x += 3;
			if (kbd.isDown(Keyboard.W)) world.camera.y -= 3;
			if (kbd.isDown(Keyboard.S)) world.camera.y += 3;
			
			if (kbd.isDown(Keyboard.SPACEBAR)) world.camera.lookAt(world.getUnique('platform'));
			
			if (kbd.isDown(Keyboard.LEFT_ARROW)) world.camera.rotation -= 0.01;
			if (kbd.isDown(Keyboard.RIGHT_ARROW)) world.camera.rotation += 0.01;
			
			if (kbd.isDown(Keyboard.UP_ARROW)) world.camera.zoom += 0.01;
			if (kbd.isDown(Keyboard.DOWN_ARROW)) world.camera.zoom -= 0.01;
			
			super.update();
		}
		
	}
	
}