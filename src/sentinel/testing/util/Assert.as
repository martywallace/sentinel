package sentinel.testing.util
{
	
	public class Assert
	{
		
		private static function _print(message:String, result:Boolean):void
		{
			trace(message + ': ' + (result ? 'Yes' : 'No'));
		}
		
		
		public static function equals(a:*, b:*, message:String):Boolean
		{
			var result:Boolean = a === b;
			_print(message, result);
			
			return result;
		}
		
		
		public static function inArray(item:*, array:Array, message:String):Boolean
		{
			var result:Boolean = array.indexOf(item) >= 0;
			_print(message, result);
			
			return result;
		}
		
	}
	
}