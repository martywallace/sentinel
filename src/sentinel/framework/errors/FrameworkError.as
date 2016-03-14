package sentinel.framework.errors {
	
	/**
	 * An error thrown by the Sentinel framework.
	 * 
	 * @author Marty Wallace
	 */
	public class FrameworkError extends Error {
		
		/**
		 * Compile and return a new FrameworkError, merging a set of data with the input message.
		 * 
		 * @param message The error message text.
		 * @param data Potential data to merge with the error message text.
		 */
		public static function compile(message:String, data:Object = null):FrameworkError {
			if (data !== null) {
				for (var token:String in data) {
					message = message.replace('{{ ' + token + ' }}', '<' + String(data[token]) + '>');
				}
			}
			
			return new FrameworkError(message, 0);
		}
		
		public function FrameworkError(message:String, id:int) {
			super(message, id);
			
			name = 'SentinelFrameworkError';
		}
		
	}
	
}