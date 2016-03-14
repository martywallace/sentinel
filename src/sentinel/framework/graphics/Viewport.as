package sentinel.framework.graphics {
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Quad;
	
	/**
	 * The game viewport, where all graphics are contained.
	 * 
	 * @author Marty Wallace.
	 */
	public class Viewport extends Sprite {
		
		public static const DEFAULT_BACKGROUND_COLOR:uint = 0xFFFFFF;
		
		private var _background:Quad;
		
		/**
		 * The viewport width.
		 */
		public override function get width():Number { return Starling.current.stage.stageWidth; }
		
		/**
		 * The viewport height.
		 */
		public override function get height():Number { return Starling.current.stage.stageHeight; }
		
		/**
		 * The viewport background color.
		 */
		public function get backgroundColor():uint { return _background.color; }
		public function set backgroundColor(value:uint):void { _background.color = value; }
		
	}
	
}