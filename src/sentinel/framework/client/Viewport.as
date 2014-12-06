package sentinel.framework.client
{
	
	import flash.geom.Point;
	import sentinel.framework.Component;
	
	
	/**
	 * Describes the game viewport (screen).
	 * @author Marty Wallace.
	 */
	public class Viewport extends Component
	{
		
		private var _center:Point;
		
		
		protected override function construct():void
		{
			_center = new Point(width / 2, height / 2);
		}
		
		
		public function get width():int { return starling.backBufferWidth; }
		public function get height():int { return starling.backBufferHeight; }
		public function get center():Point { return _center; }
		
		public override function get name():String { return 'viewport'; }
		
	}
	
}