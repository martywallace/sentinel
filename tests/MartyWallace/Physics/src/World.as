package
{
	
	import sentinel.b2.B2Debug;
	import sentinel.b2.B2Vector2D;
	import sentinel.b2.B2World;
	import sentinel.b2.B2WorldDef;
	import sentinel.base.Game;
	import sentinel.base.State;
	import sentinel.base.Thing;
	
	
	public class World extends State
	{
		
		private var _physics:B2World;
		private var _cooldown:int = 0;
		
		
		public function World()
		{
			super();
			
			_physics = new B2World(new B2WorldDef(new B2Vector2D(0, 500)));
			
			var platform:Platform = new Platform();
			add(platform);
			
			platform.body.x = viewport.width / 2;
			platform.body.y = viewport.height - 60;
		}
		
		
		public override function add(being:Thing):void
		{
			if (being is Thing)
			{
				var b:Being = being as Being;
				graphics.addChild(b.graphics);
			
				super.add(being);
			}
		}
		
		
		public override function update():void
		{
			_physics.update();
			
			if (--_cooldown <= 0)
			{
				// Lower values make blocks more frequently.
				_cooldown = 1;
				
				var block:Block = new Block();
				add(block);
				
				block.body.x = Math.random() * viewport.width;
				block.body.y = -50;
			}
			
			super.update();
		}
		
		
		public function get physics():B2World { return _physics; }
	}
	
}