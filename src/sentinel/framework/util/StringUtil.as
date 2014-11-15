package sentinel.framework.util
{
	
	public class StringUtil
	{
		
		public static function toDebugString(props:Array, values:Array):String
		{
			var output:Array = [];
			
			for(var i:int = 0; i < props.length; i++)
			{
				output.push(props[i] + "=" + values[i]);
			}
			
			return "(" + output.join(", ") + ")";
		}
		
	}
	
}