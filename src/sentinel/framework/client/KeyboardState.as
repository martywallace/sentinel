package sentinel.framework.client {
	
	import sentinel.framework.util.ObjectUtil;
	import sentinel.framework.util.StringUtil;
	
	/**
	 * Stores information about the state of the user's keyboard at a given point in time.
	 * 
	 * @author Marty Wallace
	 */
	public class KeyboardState {
		
		private var _keys:Object;
		
		public function KeyboardState(keys:Object) {
			_keys = keys;
		}
		
		public function toString():String {
			return StringUtil.toDebugString(["keysDown"], [keysDown]);
		}
		
		/**
		 * Determine whether the specified key is held down.
		 * 
		 * @param keyCode The key code to check.
		 */
		public function isDown(keyCode:uint):Boolean {
			return _keys[keyCode];
		}
		
		/**
		 * Determine whether all the keys in the specified list are held down.
		 * 
		 * @param keys A list of key codes to check.
		 */
		public function areDown(keys:Vector.<uint>):Boolean {
			for each(var i:uint in keys) {
				if(!isDown(i)) return false;
			}
			
			return true;
		}
		
		/**
		 * Determine whether X or more keys in the specified list are held down.
		 * 
		 * @param keys A list of key codes to check.
		 * @param x The required amount of keys in the list.
		 */
		public function xAreDown(keys:Vector.<uint>, x:int = 1):Boolean {
			var total:int = 0;
			
			for each(var i:uint in keys) {
				if(isDown(i)) total ++;
			}
			
			return total >= x;
		}
		
		/** The total number of keys being held down. */
		public function get keysDown():int{ return ObjectUtil.countProperties(_keys); }
		
	}
	
}