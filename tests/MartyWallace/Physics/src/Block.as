package
{
	
	import sentinel.framework.b2.B2Box;
	import sentinel.framework.b2.B2FixtureDef;
	import sentinel.framework.Thing;
	import sentinel.framework.graphics.Quad;
	
	
	public class Block extends Being
	{
		
		public function Block()
		{
			_graphics = new Quad(10 + Math.random() * 30, 10 + Math.random() * 30, Math.random() * 0xFFFFFF);
			_graphics.alignPivot();
		}
		
		
		public override function update():void
		{
			if (body.y > viewport.height + 100)
			{
				deconstruct();
			}
			
			super.update();
		}
		
		
		protected override function added(to:Thing):void
		{
			_body = (to as World).physics.createBody();
			_body.createFixture(new B2Box(_graphics.width, _graphics.height), new B2FixtureDef(1));
			
			
			super.added(to);
		}
		
	}
	
}