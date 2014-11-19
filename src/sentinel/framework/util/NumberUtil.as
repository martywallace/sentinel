package sentinel.framework.util
{
	
	public class NumberUtil
	{
		
		public static function clamp(value:Number, min:Number, max:Number):Number
		{
			return Math.max(Math.min(value, max), min);
		}
		
	}
	
}