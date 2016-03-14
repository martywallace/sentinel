package sentinel.framework {
	
	import sentinel.framework.util.NumberUtil;
	
	/**
	 * Defines initial game settings. Changing settings once the game is running does not have any
	 * affect, they are intended to be applied at game setup only.
	 * 
	 * @author Marty Wallace
	 */
	public class GameSettings {
		
		private var _debug:Boolean = false;
		private var _backgroundColor:uint = 0xFFFFFF;
		private var _antiAliasing:uint = 0;
		
		public function toString():String {
			return '[debug=' + debug + ', backgroundColor=' + backgroundColor + ', antiAliasing=' + antiAliasing + ']';
		}
		
		/**
		 * Whether or not the game is in debug mode.
		 */
		public function get debug():Boolean { return _debug; }
		public function set debug(value:Boolean):void { _debug = value; }
		
		/**
		 * The default background color of the game viewport. Can be overwritten using the
		 * background color of a loaded state.
		 */
		public function get backgroundColor():uint { return _backgroundColor; }
		public function set backgroundColor(value:uint):void { _backgroundColor = value; }
		
		/**
		 * The anti aliasing level to use when drawing Starling graphics, between 0 and 16.
		 */
		public function get antiAliasing():uint { return _antiAliasing; }
		public function set antiAliasing(value:uint):void { _antiAliasing = NumberUtil.clamp(value, 0, 16); }
		
	}
	
}