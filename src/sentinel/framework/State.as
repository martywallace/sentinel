package sentinel.framework
{
	
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	
	
	/**
	 * A State is used to define a game state e.g. the main menu, settings screen, game over screen,
	 * the gameplay itself, etc.
	 * @author Marty Wallace.
	 */
	public class State extends Thing
	{
		
		private var _graphics:IGraphicsContainer;
		
		
		public function State()
		{
			_graphics = new Sprite();
		}
		
		
		public override function deconstruct():void
		{
			_graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		public function get graphics():IGraphicsContainer { return _graphics; }
		
	}
	
}