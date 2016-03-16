package sentinel.framework {
	
	import starling.display.Sprite;
	
	/**
	 * A State is used to define a game state e.g. the main menu, settings screen, game over screen,
	 * the gameplay itself, etc.
	 * 
	 * @author Marty Wallace
	 */
	public class State extends Thing implements IGameProvider {
		
		private var _graphics:Sprite;
		
		public function State() {
			super();
			
			_graphics = new Sprite();
		}
		
		public override function deconstruct():void {
			if (_graphics) {
				_graphics.removeFromParent(true);
			}
			
			super.deconstruct();
		}
		
		/** The graphics container representing this State visually. */
		public function get graphics():Sprite { return _graphics; }
		
		/** Provides a solid background color for this State. */
		public function get backgroundColor():uint { return game.settings.backgroundColor; }
		
	}
	
}