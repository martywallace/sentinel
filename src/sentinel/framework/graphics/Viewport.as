package sentinel.framework.graphics {
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import sentinel.framework.Game;
	import sentinel.framework.IMouseDataProvider;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.ResizeEvent;
	
	/**
	 * The game viewport, where all graphics are contained.
	 * 
	 * @author Marty Wallace.
	 */
	public class Viewport extends Sprite implements IMouseDataProvider {
		
		private var _background:Quad;
		
		public function Viewport() {
			super();
			
			nativeDisplay.scaleMode = StageScaleMode.NO_SCALE;
			nativeDisplay.align = StageAlign.TOP_LEFT;
			
			Starling.current.stage.addEventListener(ResizeEvent.RESIZE, _resize);
			
			_background = addChild(new Quad(width, height, Game.getInstance().settings.backgroundColor)) as Quad;
		}
		
		private function _resize(event:ResizeEvent):void {
			// TODO: Make sure this is the right way to do this.
			
			Starling.current.viewPort = new Rectangle(0, 0, event.width, event.height);
			
			_background.width = event.width;
			_background.height = event.height;
		}
		
		/** The container that mouse coordinates provided are relative to. */
		public function get mouseContainer():DisplayObject { return this; }
		
		/** The viewport width. */
		public override function get width():Number { return Starling.current.backBufferWidth; }
		
		/** The viewport height. */
		public override function get height():Number { return Starling.current.backBufferHeight; }
		
		/** The native Flash stage. */
		public function get nativeDisplay():Stage { return Starling.current.nativeStage; }
		
		/** The viewport background color. */
		public function get backgroundColor():uint { return _background.color; }
		public function set backgroundColor(value:uint):void { _background.color = value; }
		
	}
	
}