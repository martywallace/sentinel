package
{
	
	import sentinel.b2.B2Debug;
	import sentinel.b2.B2Vector2D;
	import sentinel.b2.B2World;
	import sentinel.b2.B2WorldDef;
	import sentinel.base.Game;
	import sentinel.base.Thing;
	import starling.display.Sprite;
	
	
	public class World extends Thing
	{
		
		private var _graphics:Sprite;
		private var _physics:B2World;
		private var _cooldown:int = 0;
		
		
		public function World(game:Game)
		{
			_physics = new B2World(new B2WorldDef(new B2Vector2D(0, 500)));
			_graphics = new Sprite();
		}
		
		
		public override function add(being:Thing):void
		{
			if (being is Thing)
			{
				var b:Being = being as Being;
				_graphics.addChild(b.graphics);
			
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
		
		
		public function get graphics():Sprite { return _graphics; }
		public function get physics():B2World { return _physics; }
	}
	
}