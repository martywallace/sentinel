package
{
	import sentinel.environment.Being;
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2Box;
	import sentinel.framework.b2.B2Fixture;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	
	public class Block extends Being
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Quad = new Quad(80, 80, 0xFF0000);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(physics:B2World):B2Body
		{
			var body:B2Body = physics.createBody();
			var fixture:B2Fixture = body.createFixture(new B2Box(80, 80));
			
			return body;
		}
		
		
		public override function update():void
		{
			rotation += 0.01;
		}
		
	}
	
}