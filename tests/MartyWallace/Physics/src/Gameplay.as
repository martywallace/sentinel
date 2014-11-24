package
{
	
	import beings.Platform;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	
	
	public class Gameplay extends GameplayState
	{
		
		private var _platform:Platform;
		private var _cooldown:int = 0;
		
		
		public function Gameplay()
		{
			super(new World(new EngineDef(new Vector2D(0, 1400)), new Debug(game, 1, 0.5, 0, new <int>[Debug.SHAPE, Debug.CENTER_OF_MASS])), new HUD());
			
			world.load(JSON.parse('{"type":"sentinel.gameplay.scene::World","beings":[{"x":249.99999999999997,"rotation":0.19293092904611278,"type":"beings::Platform","y":580.0000000000001},{"x":169.95723522268236,"rotation":0,"type":"beings::Block","y":334.3888888888891,"size":22},{"x":-60.55225423805984,"rotation":-2.935677794781368,"type":"beings::Block","y":689.5232256776598,"size":17},{"x":-224.497289267629,"rotation":-2.8372755183584197,"type":"beings::Block","y":735.9424854148165,"size":33},{"x":180.4838315092736,"rotation":1.7655956831928232,"type":"beings::Block","y":522.1806306811516,"size":46},{"x":128.73612390831113,"rotation":0,"type":"beings::Block","y":40.38888888888891,"size":23},{"x":267.2124491368462,"rotation":2.863218366663568,"type":"beings::Block","y":389.22549984741266,"size":58},{"x":224.72873288345383,"rotation":-1.8458106218330186,"type":"beings::Block","y":532.8358946016638,"size":31},{"x":136.95588481000718,"rotation":0.7662470408413271,"type":"beings::Block","y":486.67970999671905,"size":48},{"x":457.099569728598,"rotation":0,"type":"beings::Block","y":556.8333333333336,"size":35},{"x":273.8704099319875,"rotation":0,"type":"beings::Block","y":159.0000000000001,"size":15},{"x":218.86414545588195,"rotation":0,"type":"beings::Block","y":-39.333333333333336,"size":31}]}'));
			
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
				trace(world.save().toJson());
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