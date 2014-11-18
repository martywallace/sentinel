package sentinel.framework
{
	
	import sentinel.framework.graphics.Sprite;
	
	
	/**
	 * A State is used to define a game state e.g. the main menu, settings screen, game over screen,
	 * the gameplay itself, etc.
	 * @author Marty Wallace.
	 */
	public class State extends Thing
	{
		
		private var _graphics:Sprite;
		
		
		public function State()
		{
			_graphics = new Sprite();
		}
		
		
		public override function deconstruct():void
		{
			_graphics.removeFromParent(true);
			_graphics.removeEventListeners();
			
			super.deconstruct();
		}
		
		
		public function get graphics():Sprite { return _graphics; }
		
	}
	
}