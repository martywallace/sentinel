package
{
	
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2Box;
	import sentinel.framework.b2.B2FixtureDef;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.events.B2ContactEvent;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.scene.Being;
	import starling.events.TouchEvent;
	
	
	public class Block extends Being
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImage('crate');
			
			graphics.width = graphics.height = 20 + Math.random() * 30;
			graphics.alignPivot();
			graphics.addEventListener(TouchEvent.TOUCH, _touch);
			
			return graphics;
		}
		
		
		protected override function defineBody(physics:B2World):B2Body
		{
			var body:B2Body = physics.createBody(B2Body.DYNAMIC, this);
			
			body.createFixture(new B2Box(graphics.width, graphics.height), new B2FixtureDef(1));
			
			body.addEventListener(B2ContactEvent.BEGIN, _beginContact);
			
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
		
		
		private function _touch(event:TouchEvent):void
		{
			deconstruct();
		}
		
		
		private function _beginContact(event:B2ContactEvent):void
		{
			// Handle collisions.
		}
		
	}
	
}