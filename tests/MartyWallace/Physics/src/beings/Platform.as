package beings
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.IUnique;
	import sentinel.gameplay.events.ContactEvent;
	
	
	public class Platform extends Being implements IUnique
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
			body.createFixture(new Box(400, 40), new FixtureDef(1, 0.5, 0.5));
			
			body.addEventListener(ContactEvent.BEGIN, _contact);
			
			return body;
		}
		
		
		private function _contact(event:ContactEvent):void
		{
			audio.sfx('sfx', 0.1).volume = 0.1;
		}
		
		
		protected override function update():void
		{
			body.rotation = Math.cos(world.ticks / 30) / 5;
			
			super.update();
		}
		
		
		public function get token():String
		{
			return 'platform';
		}
		
	}
	
}