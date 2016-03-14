package sentinel.framework {
	
	import starling.display.Sprite;
	import sentinel.framework.graphics.Viewport;
	
	/**
	 * A State is used to define a game state e.g. the main menu, settings screen, game over screen,
	 * the gameplay itself, etc.
	 * 
	 * @author Marty Wallace
	 */
	public class State implements IGameProvider {
		
		private var _graphics:Sprite;
		
		public function State() {
			_graphics = new Sprite();
		}
		
		public function deconstruct():void {
			if (_graphics) {
				_graphics.removeFromParent(true);
			}
		}
		
		public function update():void {
			//
		}
		
		internal function __update():void {
			update();
		}
		
		/**
		 * A reference to the main game class.
		 */
		public function get game():Game { return Game.getInstance(); }
		
		/**
		 * The graphics container representing this State visually.
		 */
		public function get graphics():Sprite { return _graphics; }
		
		/**
		 * Provides a solid background color for this State.
		 */
		public function get backgroundColor():uint { return Viewport.DEFAULT_BACKGROUND_COLOR; }
		
	}
	
}