package states
{
	
	import beings.Hero;
	import scene.Maze;
	import beings.Wall;
	import sentinel.gameplay.ui.UI;
	import sentinel.testing.states.TestGameplay;
	import sentinel.gameplay.scene.Being;
	
	
	public class Gameplay extends TestGameplay
	{
		
		private var _wall:Wall;
		
		
		public function Gameplay()
		{
			super(new Maze(false), new UI());
			
			world.add(new Hero());
			
			world.add(Being.create('beings::Wall', { width: 600, height: 120, x: 0, y: -300 }));
			world.add(Being.create('beings::Wall', { width: 600, height: 120, x: 0, y: 300 }));
			world.add(Being.create('beings::Wall', { width: 120, height: 600, x: -300, y: 0 }));
			world.add(Being.create('beings::Wall', { width: 120, height: 600, x: 300, y: 0 }));
			world.add(Being.create('beings::Wall', { width: 120, height: 100, x: 30, y: 0, rotation: 1 }));
		}
		
		
		
		protected override function exit():void
		{
			game.loadState(new Menu());
		}
		
		
		protected override function get backgroundColor():uint { return 0x000066; }
		
	}
	
}