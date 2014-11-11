package  
{
	
	import sentinel.b2.B2Debug;
	import sentinel.b2.B2Fixture;
	import sentinel.base.Game;
	import sentinel.base.Thing;
	import sentinel.b2.B2Body;
	import sentinel.b2.B2Vector2D;
	import sentinel.b2.B2WorldDef;
	import sentinel.b2.B2World;
	import sentinel.b2.B2Box;
	
	
	public class TestGame extends Game
	{
		
		private var _heroes:Vector.<Hero> = new <Hero>[];
		private var _world:B2World;
		
		
		public override function construct():void
		{
			_world = new B2World(null, new B2Debug(this, 1, 1, 0.1, new <int>[B2Debug.SHAPE]));
			
			for (var i:int = 0; i < 100; i++)
			{
				var t:B2Body = _world.createBody(B2Body.DYNAMIC);
				var s:B2Box = new B2Box(30, 30);
				var f:B2Fixture = t.createFixture(s);
				
				t.x = Math.random() * viewport.width;
				t.y = Math.random() * viewport.height;
				t.angularVelocity = Math.random();
			}
			
			//
		}
		
		
		public override function update():void
		{
			_world.update();
			
			for each(var i:Hero in _heroes)
			{
				i.update();
			}
		}
		
	}

}