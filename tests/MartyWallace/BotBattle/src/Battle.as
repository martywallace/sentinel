package
{
	
	import flash.geom.Point;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.UI;
	
	
	public class Battle extends GameplayState
	{
		
		public function Battle()
		{
			super(new World(new EngineDef()), new UI());
			
			var teams:int = 4;
			var bots:int = 12;
			
			
			for (var t:int = 0; t < teams; t++)
			{
				var team:Team = new Team(Math.random() * 0xFFFFFF, Random.inRectangle(0, 0, viewport.width, viewport.height));
				
				for (var b:int = 0; b < bots; b++)
				{
					var bot:Bot = new Bot(team);
					var position:Point = Random.inCircle(team.position.x, team.position.y, 100);
					
					bot.x = position.x;
					bot.y = position.y;
					
					world.add(bot);
				}
			}
			
			world.camera.x = viewport.center.x;
			world.camera.y = viewport.center.y;
		}
		
	}
	
}