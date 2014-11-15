package
{
	
	import sentinel.environment.Being;
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2Box;
	import sentinel.framework.b2.B2FixtureDef;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	
	
	public class Block extends Being
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Quad = new Quad(10 + Math.random() * 30, 10 + Math.random() * 30, Math.random() * 0xFFFFFF);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(physics:B2World):B2Body
		{
			var body:B2Body = physics.createBody();
			body.createFixture(new B2Box(graphics.width, graphics.height), new B2FixtureDef(1));
			
			return body;
		}
		
		
		public override function update():void
		{
			if (body.y > viewport.height + 100)
			{
				deconstruct();
			}
			
			super.update();
		}
		
	}
	
}