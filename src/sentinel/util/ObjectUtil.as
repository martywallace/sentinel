package sentinel.util
{
	
	public class ObjectUtil
	{
		
		public static function copy(object:Object):Object
		{
			return JSON.parse(JSON.stringify(object));
		}
		
		
		public static function shallowCopy(object:Object):Object
		{
			var result:Object = {};
			for(var prop:String in object) result[prop] = object[prop];
			
			return result;
		}
		
		
		public static function countProperties(object:Object):int
		{
			var total:int = 0;
			for(var prop:String in object) total ++;
			
			return total;
		}
		
	}
	
}