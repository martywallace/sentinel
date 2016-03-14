package sentinel.framework.graphics {
	
	import flash.geom.Point;
	import sentinel.framework.errors.FrameworkError;
	import sentinel.framework.Service;
	
	/**
	 * The game viewport, where all graphics are contained.
	 * 
	 * @author Marty Wallace.
	 */
	public class Viewport extends Sprite {
		
		public static const DEFAULT_BACKGROUND_COLOR:uint = 0xFFFFFF;
		
		private var _center:Point;
		private var _background:Quad;
		
		protected override function construct():void {
			_center = new Point(width / 2, height / 2);
		}
		
		/**
		 * The viewport width.
		 */
		public override function get width():Number { return game.starling.backBufferWidth; }
		
		/**
		 * The viewport height.
		 */
		public override function get height():Number { return game.starling.backBufferHeight; }
		
		/**
		 * A point representing the center of the viewport along both the x and y axis.
		 */
		public function get center():Point { return _center; }
		
		public override function set x(value:Number):void {
			throw new FrameworkError.compile('Cannot reposition the game viewport.');
		}
		
		public override function set y(value:Number):void {
			throw new FrameworkError.compile('Cannot reposition the game viewport.');
		}
		
		public function get backgroundColor():uint { return _background.color; }
		public function set backgroundColor(value:uint):void { _background.color = value; }
		
	}
	
}