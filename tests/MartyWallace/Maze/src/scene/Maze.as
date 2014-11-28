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
		}
		
		
		public function get hero():Hero { return getUnique('hero') as Hero; }
		
	}
	
}