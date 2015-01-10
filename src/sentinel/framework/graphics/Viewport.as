package sentinel.framework.graphics
{
	
	import sentinel.framework.Service;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * Describes the game viewport (screen).
	 * @author Marty Wallace.
	 */
	public class Viewport extends Service
	{
		
		private var _center:Vector2D;
		
		
		protected override function construct():void
		{
			_center = new Vector2D(width / 2, height / 2);
		}
		
		
		/**
		 * The viewport width, in pixels.
		 */
		public function get width():int { return game.starling.backBufferWidth; }
		
		/**
		 * The viewport height, in pixels.
		 */
		public function get height():int { return game.starling.backBufferHeight; }
		
		/**
		 * The center point along the x and y axis within the viewport.
		 */
		public function get center():Vector2D { return _center; }
		
		/**
		 * The service name.
		 */
		public override function get name():String { return 'viewport'; }
		
	}
	
}