package
{
	
	import sentinel.base.Game;
	
	
	public class PhysicsTest extends Game
	{
		
		private var _world:World;
		
		
		public function PhysicsTest()
		{
			_world = new World(this);
			
			var platform:Platform = new Platform();
			_world.add(platform);
			
			platform.body.x = viewport.width / 2;
			platform.body.y = viewport.height - 60;
			
			addChild(_world.graphics);
		}
		
		
		public override function update():void
		{
			_world.update();
		}
		
	}
	
}