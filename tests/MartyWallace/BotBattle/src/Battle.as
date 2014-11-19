package
{
	
	import flash.geom.Point;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	import sentinel.gameplay.ui.UI;
	import sentinel.framework.util.Random;
	
	
	public class Battle extends GameplayState
	{
		
		public function Battle()
		{
			super(new World(), new UI());
			
			var teams:int = 3;
			var bots:int = 3;
			
			
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