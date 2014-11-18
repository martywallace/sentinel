package
{
	
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2Box;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.scene.Being;
	
	
	public class Platform extends Being
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImage('crate');
			
			graphics.width = 400;
			graphics.height = 60;
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(physics:B2World):B2Body
		{
			var body:B2Body = physics.createBody(B2Body.STATIC, this);
			body.createFixture(new B2Box(graphics.width, graphics.height));
			
			return body;
		}
		
		
		public override function update():void
		{
			body.rotation = Math.cos(world.ticks / 30) / 5;
			
			super.update();
		}
		
	}
	
}