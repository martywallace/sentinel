package scene
{
	
	import sentinel.framework.Data;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.IQueryable;
	import starling.events.TouchEvent;
	
	
	public class Block extends Being implements IQueryable
	{
		
		private var _size:int = 10;
		
		
		public function Block()
		{
			super();
			
			_size = Random.between(10, 60);
		}
		
		
		public override function save():Data
		{
			return super.save().merge({ size: _size });
		}
		
		
		public override function load(data:Data):void
		{
			super.load(data);
			
			_size = data.get('size', _size);
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
		
	}
	
}