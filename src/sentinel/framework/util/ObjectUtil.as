package sentinel.framework.util
{
	
	/**
	 * Utilities for working with Objects.
	 * @author Marty Wallace.
	 */
	public class ObjectUtil
	{
		
		public static function copy(object:Object):Object
		{
			return JSON.parse(JSON.stringify(object));
		}
		
		
		/**
		 * Create a shallow copy of the target Object.
		 * @param object The target Object.
		 */
		public static function shallowCopy(object:Object):Object
		{
			var result:Object = {};
			for(var prop:String in object) result[prop] = object[prop];
			
			return result;
		}
		
		
		/**
		 * Returns the total number of properties associated with an Object.
		 * @param object The target Object.
		 */
		public static function countProperties(object:Object):int
		{
			var total:int = 0;
			for(var prop:String in object) total ++;
			
			return total;
		}
		
		
		/**
		 * Merge a collection of Objects. Objects appearing earlier in the list will have their
		 * properties overwritten with those who appear later in the list.
		 * @param ...objects The list of Objects to merge.
		 */
		public static function merge(...objects):Object
		{
			var base:Object = { };
			
			for each(var o:Object in objects)
			{
				for (var prop:String in o)
				{
					base[prop] = o[prop];
				}
			}
			
			return base;
		}
		
		
		/**
		 * Fetch a property of an object, or a fallback value if the property is not defined.
		 * @param target The target object.
		 * @param prop The property to fetch.
		 * @param fallback The fallback value to use.
		 */
		public static function prop(target:Object, prop:String, fallback:* = null):*
		{
			if (target === null) return fallback;
			
			return target.hasOwnProperty(prop) ? target[prop] : fallback;
		}
		
	}
	
}