package sentinel.framework.client
{
	
	import flash.geom.Point;
	import sentinel.framework.Game;
	
	
	/**
	 * Describes the game viewport (screen).
	 * @author Marty Wallace.
	 */
	public class Viewport
	{
		
		private var _game:Game;
		
		
		public function Viewport(game:Game)
		{
			_game = game;
		}
		
		
		public function get width():int { return _game.starling.backBufferWidth; }
		public function get height():int { return _game.starling.backBufferHeight; }
		
		public function get center():Point { return new Point(width / 2, height / 2); }
		
		public function get top():Point { return new Point(width / 2, 0); }
		public function get bottom():Point { return new Point(width / 2, height); }
		public function get left():Point { return new Point(0, height / 2); }
		public function get right():Point { return new Point(width, height / 2); }
		
		public function get topLeft():Point { return new Point(0, 0); }
		public function get topRight():Point { return new Point(width, 0); }
		public function get bottomLeft():Point { return new Point(0, height); }
		public function get bottomRight():Point { return new Point(width, height); }
		
	}
	
}