package beings
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.util.ObjectUtil;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.events.ContactEvent;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.scene.Being;
	import starling.events.TouchEvent;
	
	
	public class Block extends Being
	{
		
		private var _size:int = 10;
		
		
		public function Block()
		{
			super();
			
			_size = Random.between(10, 60);
		}
		
		
		public override function save():Object
		{
			return ObjectUtil.merge(super.save(), { size: _size });
		}
		
		
		public override function load(data:Object):void
		{
			super.load(data);
			
			_size = ObjectUtil.prop(data, 'size', _size);
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImage('crate');
			
			graphics.width = graphics.height = _size;
			graphics.alignPivot();
			graphics.addEventListener(TouchEvent.TOUCH, _touch);
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			
			body.createFixture(new Box(_size, _size), new FixtureDef(1));
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