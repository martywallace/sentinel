package sentinel.framework.client
{
	
	import flash.geom.Point;
	import sentinel.framework.Service;
	
	
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
		
		
		public function get width():int { return game.starling.backBufferWidth; }
		public function get height():int { return game.starling.backBufferHeight; }
		public function get center():Point { return _center; }
		
		public override function get name():String { return 'viewport'; }
		
	}
	
}