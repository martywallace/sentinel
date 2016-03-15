package sentinel.framework.util {
	
	/**
	 * Utilities for working with or generating strings.
	 * 
	 * @author Marty Wallace
	 */
	public class StringUtil {
		
		/**
		 * Format a collection of values for output in the debug console.
		 * @param props A list of property names to appear in the console.
		 * @param values An equal-length list of values to appear beside each element in the props
		 * array.
		 */
		public static function toDebugString(props:Array, values:Array):String {
			var output:Array = [];
			
			for (var i:int = 0; i < props.length; i++) {
				output.push(props[i] + '=' + values[i]);
			}
			
			return '(' + output.join(', ') + ')';
		}
		
	}
	
}