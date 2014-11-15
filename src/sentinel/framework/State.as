package sentinel.framework
{
	
	import sentinel.framework.graphics.Sprite;
	
	
	public class State extends Thing
	{
		
		private var _graphics:Sprite;
		
		
		public function State()
		{
			_graphics = new Sprite();
		}
		
		
		public override function deconstruct():void
		{
			_graphics.removeFromParent();
			_graphics.removeEventListeners();
			
			super.deconstruct();
		}
		
		
		public function get graphics():Sprite { return _graphics; }
		
	}
	
}