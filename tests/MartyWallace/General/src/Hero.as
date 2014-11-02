package  
{
	import flash.geom.Point;
	import sentinel.base.Thing;
	import sentinel.user.Keyboard;
	import sentinel.user.KeyboardState;
	import starling.display.Quad;
	import starling.events.TouchEvent;
	
	/**
	 * ...
	 * @author Marty Wallace
	 */
	public class Hero extends Thing
	{
		
		private var _graphics:Quad;
		private var _velocity:Point;
		
		
		public function Hero() 
		{
			_graphics = new Quad(16, 16, Math.random() * 0xFFFFFF);
			_graphics.alignPivot();
			
			_velocity = new Point( -1 + Math.random() * 2, -1 + Math.random() * 2);
			
			_graphics.addEventListener(TouchEvent.TOUCH, _touch);
		}
		
		
		public override function deconstruct():void
		{
			_graphics.removeFromParent(true);
			
			super.deconstruct();
		}
		
		
		private function _touch(event:TouchEvent):void
		{
			removeFromParent();
		}
		
		
		public override function update():void
		{
			_graphics.rotation += 0.01;
			_graphics.x += _velocity.x;
			_graphics.y += _velocity.y;
			
			if (_graphics.x > viewport.width) _graphics.x = 0;
			if (_graphics.x < 0) _graphics.x = viewport.width;
			if (_graphics.y > viewport.height) _graphics.y = 0;
			if (_graphics.y < 0) _graphics.y = viewport.height;
		}
		
		
		public function get graphics():Quad { return _graphics; }
		
	}

}