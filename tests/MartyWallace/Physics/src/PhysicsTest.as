package
{
	
	import sentinel.environment.World;
	import sentinel.framework.Game;
	
	
	public class PhysicsTest extends Game
	{
		
		public override function construct():void
		{
			var w:World = new World();
			
			loadState(new TestWorld());
		}
		
	}
	
}