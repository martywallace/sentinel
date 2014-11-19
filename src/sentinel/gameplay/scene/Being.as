package sentinel.gameplay.scene
{
	
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.Thing;
	import sentinel.gameplay.ui.UI;
	import starling.display.DisplayObject;
	
	
	public class Being extends Thing
	{
		
		private var _graphics:IGraphics;
		private var _body:B2Body;
		
		private var _x:Number = 0;
		private var _y:Number = 0;
		private var _rotation:Number = 0;
		
		
		public override function deconstruct():void
		{
			if(_graphics !== null) _graphics.deconstruct();
			if(_body !== null) _body.deconstruct();
			
			super.deconstruct();
		}
		
		
		protected override function update():void
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
				
				if (_graphics !== null)
				{
					// Add the graphics to the World's graphics container.
					(world as World).__content.addChild(_graphics as DisplayObject);
					
					_graphics.x = _x;
					_graphics.y = _y;
					_graphics.rotation = _rotation;
				}
				
				if ((world as World).physics !== null)
				{
					// Attempt to define a body for this Being.
					_body = defineBody((world as World).physics);
					
					_body.x = _x;
					_body.y = _y;
					_body.rotation = _rotation;
				}
				
				alignGraphicsToBody();
			}
			else
			{
				throw new Error("Instances of Being can only be added to a World.");
			}
		}
		
		
		protected final override function removed(world:Thing):void
		{
			if (world is World)
			{
				if (_graphics !== null) _graphics.deconstruct();
				if (_body !== null) _body.deconstruct();
			}
			else
			{
				throw new Error("Instances of Being can only be removed from a World.");
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
		
		public function get x():Number { return _body !== null ? _body.x : (_graphics !== null ? _graphics.x : _x); }
		
		public function set x(value:Number):void
		{
			_x = value;
			
			if (_body !== null) _body.x = value;
			if (_graphics !== null) _graphics.x = value;
		}
		
		public function get y():Number { return _body !== null ? _body.y : (_graphics !== null ? _graphics.y : _y); }
		
		public function set y(value:Number):void
		{
			_y = value;
			
			if (_body !== null) _body.y = value;
			if (_graphics !== null) _graphics.y = value;
		}
		
		public function get rotation():Number { return _body !== null ? _body.rotation : (_graphics !== null ? _graphics.rotation : _rotation); }
		
		public function set rotation(value:Number):void
		{
			_rotation = value;
			
			if (_body !== null) _body.rotation = value;
			if (_graphics !== null) _graphics.rotation = value;
		}
		
		protected function get ui():UI { return world !== null ? world.ui : null; }
		protected function get camera():Camera { return world !== null ? world.camera : null; }
		
	}
	
}