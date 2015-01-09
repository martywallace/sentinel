package sentinel.framework
{
	
	import sentinel.framework.util.ObjectUtil;
	
	
	/**
	 * Arbitrary data wrapped in helper methods.
	 * @author Marty Wallace.
	 */
	public class Data
	{
		
		/**
		 * Creates a Data object from a primitive Object.
		 * @param object Target primitive Object.
		 */
		public static function create(object:Object):Data
		{
			return new Data(object);
		}
		
		
		private var _raw:Object;
		
		
		/**
		 * Constructor.
		 * @param object Primitive Object to consume and use as the base for this Data object.
		 */
		public function Data(object:Object = null)
		{
			_raw = object === null ? { } : object;
		}
		
		
		/**
		 * Merge this Data with another set of Data and return the combined result.
		 * @param data The Data to be merged with.
		 */
		public function merge(data:Object):Data
		{
			return create(ObjectUtil.merge(_raw, data is Data ? data.raw : data));
		}
		
		
		/**
		 * Returns true if the field is defined on this object.
		 * @param field The field to check for.
		 */
		public function has(field:String):Boolean
		{
			return _raw.hasOwnProperty(field);
		}
		
		
		/**
		 * Get a value.
		 * @param field The name of the field to get the value of.
		 * @param fallback Fallback value to use if the field is undefined.
		 */
		public function get(field:String, fallback:* = null):*
		{
			return has(field) ? _raw[field] : fallback; 
		}
		
		
		/**
		 * Set a value.
		 * @param field The field to set the value of.
		 * @param value The value to assign to the target field.
		 */
		public function set(field:String, value:*):void
		{
			_raw[field] = value;
		}
		
		
		/**
		 * Delete a field.
		 * @param field The field to delete.
		 */
		public function del(field:String):void
		{
			delete _raw[field];
		}
		
		
		public function toJson():String
		{
			return JSON.stringify(_raw);
		}
		
		
		public function get raw():Object { return _raw; }
		
	}
	
}