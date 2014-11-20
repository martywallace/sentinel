package
{
	
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.physics.Engine;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.Quad;
	import sentinel.gameplay.scene.Being;
	
	
	public class Platform extends Being
	{
		
		public function Platform()
		{
			super();
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Quad = new Quad(400, 40, 0x333333);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.STATIC, this);
			body.createFixture(new Box(graphics.width, graphics.height), new FixtureDef(1, 0.5, 0.5));
			
			return body;
		}
		
		
		protected override function update():void
		{
			body.rotation = Math.cos(world.ticks / 30) / 5;
			
			super.update();
		}
		
	}
	
}