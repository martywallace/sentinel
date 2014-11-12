package
{
	
	import sentinel.b2.B2Body;
	import sentinel.base.Thing;
	import starling.display.Quad;
	
	
	public class Being extends Thing
	{
		
		protected var _graphics:Quad;
		protected var _body:B2Body;
		
		
		public override function deconstruct():void
		{
			_graphics.removeFromParent();
			_graphics.removeEventListeners();
			_body.deconstruct();
			
			super.deconstruct();
		}
		
		
		public override function update():void
		{
			_graphics.x = _body.x;
			_graphics.y = _body.y;
			_graphics.rotation = _body.rotation;
			
			super.update();
		}
		
		
		public function get graphics():Quad { return _graphics; }
		public function get body():B2Body { return _body; }
		public function get world():World { return parent as World; }
		
	}
	
}