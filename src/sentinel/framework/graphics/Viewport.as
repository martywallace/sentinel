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
		
		
		public function get width():int { return game.starling.backBufferWidth; }
		public function get height():int { return game.starling.backBufferHeight; }
		public function get center():Vector2D { return _center; }
		
		public override function get name():String { return 'viewport'; }
		
	}
	
}