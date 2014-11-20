package
{
	
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.events.ContactEvent;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.scene.Being;
	import starling.events.TouchEvent;
	
	
	public class Block extends Being
	{
		
		public function Block()
		{
			super();
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImage('crate');
			
			graphics.width = graphics.height = 20 + Math.random() * 30;
			graphics.alignPivot();
			graphics.addEventListener(TouchEvent.TOUCH, _touch);
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			
			body.createFixture(new Box(graphics.width, graphics.height), new FixtureDef(1));
			body.addEventListener(ContactEvent.BEGIN, _beginContact);
			
			return body;
		}
		
		
		protected override function update():void
		{
			if (y > viewport.height + 100)
			{
				deconstruct();
			}
			
			super.update();
		}
		
		
		private function _touch(event:TouchEvent):void
		{
			deconstruct();
		}
		
		
		private function _beginContact(event:ContactEvent):void
		{
			// Handle collisions.
		}
		
	}
	
}