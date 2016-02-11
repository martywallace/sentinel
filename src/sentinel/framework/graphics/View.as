package sentinel.framework.graphics {
	import starling.core.Starling;
	import starling.display.Sprite;

	/**
	 * The game view. This is the root starling display object.
	 * 
	 * @author Marty Wallace
	 */
	public class View extends Sprite {

		/** The total game width. */
		public override function get width():Number { return Starling.current.backBufferWidth; }
		
		/** The total game height. */
		public override function get height():Number { return Starling.current.backBufferHeight; }
		
	}
}