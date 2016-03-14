package sentinel.framework.util {
	
	/**
	 * Utilities dealing with numeric values.
	 * 
	 * @author Marty Wallace
	 */
	public class NumberUtil {
		
		/**
		 * Clamp a value between a minimum and maximum value.
		 * 
		 * @param value The input value.
		 * @param min The minimum allowed value.
		 * @param max The maximum allowed value.
		 */
		public static function clamp(value:Number, min:Number, max:Number):Number {
			return Math.max(Math.min(value, max), min);
		}
		
	}
	
}