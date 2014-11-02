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
			
			var t:Thing = new Thing();
			
			t.add(new Thing());
			t.add(new Thing());
			t.add(new Thing());
			
			t.children[0].add( new Thing());
			
			t.removeAll(true);
			trace(t.children);
			
			for each(var thing:Thing in _heroes)
			{
				thing.removeFromParent(true);
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