package
{
	
	import sentinel.framework.b2.B2Box;
	import sentinel.framework.Thing;
	import starling.display.Quad;
	import sentinel.framework.b2.B2Body;
	
	
	public class Platform extends TestBeing
	{
		
		public function Platform()
		{
			_graphics = new Quad(400, 20, 0x222222);
			_graphics.alignPivot();
		}
		
		
		public override function update():void
		{
			body.rotation = Math.cos(game.ticks / 30) / 5;
			
			super.update();
		}
		
		
		protected override function added(to:Thing):void
		{
			_body = (to as TestWorld).physics.createBody(B2Body.STATIC);
			_body.createFixture(new B2Box(_graphics.width, _graphics.height));
			
			super.added(to);
		}
		
	}
	
}