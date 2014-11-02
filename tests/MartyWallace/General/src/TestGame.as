package  
{
	
	import sentinel.base.Game;
	import sentinel.base.Thing;
	
	
	public class TestGame extends Game
	{
		
		private var _heroes:Vector.<Hero> = new <Hero>[];
		
		
		public override function construct():void
		{
			for (var i:int = 0; i < 1000; i++)
			{
				var hero:Hero = new Hero();
				
				hero.graphics.x = Math.random() * viewport.width;
				hero.graphics.y = Math.random() * viewport.height;
				
				_heroes.push(hero);
				addChild(hero.graphics);
			}
		}
		
		
		public override function update():void
		{
			for each(var i:Hero in _heroes)
			{
				i.update();
			}
		}
		
	}

}