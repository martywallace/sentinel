package sentinel.framework.client
{
	
	import sentinel.framework.Game;
	
	
	public class Viewport
	{
		
		private var _game:Game;
		
		
		public function Viewport(game:Game)
		{
			_game = game;
		}
		
		
		/**
		 * The viewport width.
		 */
		public function get width():int { return _game.starling.backBufferWidth; }
		
		/**
		 * The viewport height.
		 */
		public function get height():int { return _game.starling.backBufferHeight; }
		
		/**
		 * The center of the viewport along the X axis.
		 */
		public function get middleX():Number { return width / 2; }
		
		/**
		 * The center of the viewport along the Y axis.
		 */
		public function get middleY():Number { return height / 2; }
		
	}
	
}