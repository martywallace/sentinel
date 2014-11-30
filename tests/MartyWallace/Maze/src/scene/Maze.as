package scene
{
	
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.scene.World;
	import beings.Hero;
	
	
	public class Maze extends World
	{
		
		public function Maze(debug:Boolean = false)
		{
			super(new EngineDef(), debug ? new Debug(game) : null);
			
			camera.rotation = 0.05;
		}
		
		
		protected override function update():void
		{
			super.update();
			
			if (hero !== null)
			{
				camera.lookAt(hero);
			}
		}
		
		
		public function get hero():Hero { return getUnique('hero') as Hero; }
		
	}
	
}