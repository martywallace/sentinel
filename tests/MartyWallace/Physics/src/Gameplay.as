package
{
	
	import beings.Platform;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.gameplay.events.RegionEvent;
	import sentinel.gameplay.events.WorldEvent;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.scene.Boundary;
	import sentinel.gameplay.scene.Region;
	import sentinel.gameplay.scene.World;
	import sentinel.testing.states.TestGameplay;
	import sentinel.framework.util.Random;
	
	
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
			
			var region:Region = world.add(new Region(new <Vector2D>[
				new Vector2D(),
				new Vector2D(100, 0),
				new Vector2D(100, 100),
				new Vector2D(0, 100)
			])) as Region;
			
			region.rotation = Random.angle;
			region.x = viewport.center.x;
			region.y = viewport.center.y;
			
			region.addEventListener(RegionEvent.ENTER, _regionHandler);
			region.addEventListener(RegionEvent.EXIT, _regionHandler);
			
			world.camera.x = viewport.center.x;
			world.camera.y = viewport.center.y;
			
			world.addEventListener(WorldEvent.FREEZE, _worldFreezeHandler);
		}
		
		
		private function _worldFreezeHandler(event:WorldEvent):void
		{
			// A good place to set up a pause menu.
			// ...
		}
		
		
		private function _regionHandler(event:RegionEvent):void
		{
			trace(event.type + ': ' + event.being);
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
		
		
		protected override function get backgroundColor():uint { return 0x666666; }
		
	}
	
}