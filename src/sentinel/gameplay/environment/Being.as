package sentinel.gameplay.environment
{
	
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.Thing;
	
	
	public class Being extends Thing
	{
		
		private var _graphics:IGraphics;
		private var _body:B2Body;
		
		
		public override function deconstruct():void
		{
			_graphics.deconstruct();
			_body.deconstruct();
			
			super.deconstruct();
		}
		
		
		public override function update():void
		{
			alignGraphicsToBody();
			
			super.update();
		}
		
		
		public function alignGraphicsToBody():void
		{
			if (_graphics !== null && _body !== null)
			{
				_graphics.x = _body.x;
				_graphics.y = _body.y;
				_graphics.rotation = _body.rotation;
			}
		}
		
		
		public function alignBodyToGraphics():void
		{
			if (_graphics !== null && _body !== null)
			{
				_body.x = _graphics.x;
				_body.y = _graphics.y;
				_body.rotation = _graphics.rotation;
			}
		}
		
		
		protected final override function added(world:Thing):void
		{
			if (world is World)
			{
				_graphics = defineGraphics();
				
				if ((world as World).physics !== null)
				{
					_body = defineBody((world as World).physics);
				}
			}
		}
		
		
		protected final override function removed(world:Thing):void
		{
			if (world is World)
			{
				if (_graphics !== null) _graphics.deconstruct();
				if (_body !== null) _body.deconstruct();
			}
		}
		
		
		protected function defineGraphics():IGraphics
		{
			return null;
		}
		
		
		protected function defineBody(physics:B2World):B2Body
		{
			return null;
		}
		
		
		public function get world():World { return parent as World; }
		public function get graphics():IGraphics { return _graphics; }
		public function get body():B2Body { return _body; }
		
		public function get x():Number { return _body !== null ? _body.x : (_graphics !== null ? _graphics.x : 0); }
		
		public function set x(value:Number):void
		{
			if (_body !== null) _body.x = value;
			if (_graphics !== null) _graphics.x = value;
		}
		
		public function get y():Number { return _body !== null ? _body.y : (_graphics !== null ? _graphics.y : 0); }
		
		public function set y(value:Number):void
		{
			if (_body !== null) _body.y = value;
			if (_graphics !== null) _graphics.y = value;
		}
		
		public function get rotation():Number { return _body !== null ? _body.rotation : (_graphics !== null ? _graphics.rotation : 0); }
		
		public function set rotation(value:Number):void
		{
			if (_body !== null) _body.rotation = value;
			if (_graphics !== null) _graphics.rotation = value;
		}
		
	}
	
}