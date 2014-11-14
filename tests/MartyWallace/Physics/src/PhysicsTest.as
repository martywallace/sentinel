package
{
	
	import sentinel.base.Game;
	
	
	public class PhysicsTest extends Game
	{
		
		public override function construct():void
		{
			loadState(new World());
		}
		
	}
	
}