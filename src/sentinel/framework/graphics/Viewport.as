// TODO: Handle viewport resize.

package sentinel.framework.graphics {
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.ResizeEvent;
	
	/**
	 * The game viewport, where all graphics are contained.
	 * 
	 * @author Marty Wallace.
	 */
	public class Viewport extends Sprite {
		
		/**
		 * The default viewport background color.
		 */
		public static const DEFAULT_BACKGROUND_COLOR:uint = 0xFFFFFF;
		
		private var _background:Quad;
		
		public function Viewport() {
			super();
			
			nativeDisplay.scaleMode = StageScaleMode.NO_SCALE;
			nativeDisplay.align = StageAlign.TOP_LEFT;
			
			Starling.current.stage.addEventListener(ResizeEvent.RESIZE, _resize);
			
			_background = addChild(new Quad(width, height, DEFAULT_BACKGROUND_COLOR)) as Quad;
		}
		
		private function _resize(event:ResizeEvent):void {
			Starling.current.viewPort = new Rectangle(0, 0, event.width, event.height);
		}
		
		/**
		 * The viewport width.
		 */
		public override function get width():Number { return Starling.current.backBufferWidth; }
		
		/**
		 * The viewport height.
		 */
		public override function get height():Number { return Starling.current.backBufferHeight; }
		
		/**
		 * The native Flash stage.
		 */
		public function get nativeDisplay():Stage { return Starling.current.nativeStage; }
		
		/**
		 * The viewport background color.
		 */
		public function get backgroundColor():uint { return _background.color; }
		public function set backgroundColor(value:uint):void { _background.color = value; }
		
	}
	
}