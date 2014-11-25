package
{
	
	import beings.Platform;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.Boundary;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.framework.util.Random;
	
	
	public class Gameplay extends GameplayState
	{
		
		private var _platform:Platform;
		private var _boundary:Boundary;
		
		private var _cooldown:int = 0;
		
		
		public function Gameplay()
		{
			super(new World(new EngineDef(new Vector2D(0, 1400)), new Debug(game, 1, 0.5, 0, new <int>[Debug.SHAPE, Debug.CENTER_OF_MASS])), new HUD());
			
			world.load(JSON.parse('{"type":"sentinel.gameplay.scene::World","beings":[{"x":250,"rotation":0.1998888991765737,"type":"beings::Platform","y":580},{"x":169.96,"rotation":0,"type":"beings::Block","y":334.78,"size":22},{"x":-60.55,"rotation":-2.935677794781368,"type":"beings::Block","y":689.91,"size":17},{"x":-224.5,"rotation":-2.8372755183584197,"type":"beings::Block","y":736.33,"size":33},{"x":180.53,"rotation":1.761299327567712,"type":"beings::Block","y":522.44,"size":46},{"x":128.74,"rotation":0,"type":"beings::Block","y":40.78,"size":23},{"x":267.21,"rotation":2.863218366663568,"type":"beings::Block","y":389.61,"size":58},{"x":224.73,"rotation":-1.8458106218330184,"type":"beings::Block","y":533.22,"size":31},{"x":136.9,"rotation":0.7650268000226813,"type":"beings::Block","y":487.03,"size":48},{"x":457.1,"rotation":0,"type":"beings::Block","y":557.22,"size":35},{"x":273.87,"rotation":0,"type":"beings::Block","y":159.39,"size":15},{"x":218.86,"rotation":0,"type":"beings::Block","y":-38.94,"size":31},{"x":250,"friction":0.2,"type":"sentinel.gameplay.scene::Boundary","y":200,"rotation":1.9107578203099607,"verticies":[{"y":0,"x":0},{"y":0,"x":30},{"y":30,"x":30},{"y":30,"x":0}],"restitution":0}]}'));
			
			world.camera.x = viewport.center.x;
			world.camera.y = viewport.center.y;
			
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
				trace(JSON.stringify(world.save()));
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