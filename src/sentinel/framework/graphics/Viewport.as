package sentinel.framework.graphics
{
	
	import sentinel.framework.Service;
	import starling.geom.Point;
	
	
	/**
	 * Describes the game viewport (screen).
	 * @author Marty Wallace.
	 */
	public class Viewport extends Service
	{
		
		private var _center:Point;
		
		
		protected override function construct():void
		{
			_center = new Point(width / 2, height / 2);
		}
		
		
		/**
		 * The viewport width.
		 */
		public function get width():int { return game.starling.backBufferWidth; }
		
		/**
		 * The viewport height.
		 */
		public function get height():int { return game.starling.backBufferHeight; }
		
		/**
		 * A point representing the center of the viewport along both the x and y axis.
		 */
		public function get center():Point { return _center; }
		
		public override function get name():String { return 'viewport'; }
		
	}
	
}