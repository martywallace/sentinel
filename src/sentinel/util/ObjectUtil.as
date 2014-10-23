package sentinel.util
{
	
	public class ObjectUtil
	{
		
		public static function copy(object:Object):Object
		{
			// todo: Probably slow.
			return JSON.parse(JSON.stringify(object));
		}
		
	}
	
}