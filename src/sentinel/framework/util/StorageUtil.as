package sentinel.framework.util 
{
	
	import sentinel.framework.IStorable;
	
	
	/**
	 * Utilities for working with IStorable objects.
	 * @author Marty Wallace.
	 */
	public class StorageUtil
	{
		
		/**
		 * Attempts to convert an input list type (array, Vector.<T>) to a Vector.<IStorable> list.
		 * @param input The input list.
		 */
		public static function toStorables(input:*):Vector.<IStorable>
		{
			return Vector.<IStorable>(input);
		}
		
		
		/**
		 * Generates an array containing the result of calling <code>save()</code> on each item in
		 * an input list.
		 * @param list The list to work with.
		 */
		public static function saveList(list:*):Array
		{
			var result:Array = [];
			
			for each(var storable:IStorable in toStorables(list))
			{
				result.push(storable.save());
			}
			
			return result;
		}
		
	}

}