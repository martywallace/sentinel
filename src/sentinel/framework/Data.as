package sentinel.framework
{
	
	import sentinel.framework.util.ObjectUtil;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	
	/**
	 * Arbitrary data wrapped in helper methods.
	 * @author Marty Wallace.
	 */
	public final dynamic class Data extends Proxy
	{
		
		/**
		 * Creates a Data object from a primitive Object.
		 * @param object Target primitive Object.
		 */
		public static function create(object:Object):Data
		{
			return new Data(object);
		}
		
		
		private var _internal:Object;
		private var _fields:Array;
		
		
		/**
		 * Constructor.
		 * @param object Primitive Object to consume and use as the base for this Data object.
		 */
		public function Data(object:Object = null)
		{
			_internal = object === null ? {} : object;
		}
		
		
		/**
		 * Merge this Data with another set of Data and return the combined result.
		 * @param data The Data to be merged with.
		 */
		public function merge(data:Object):Data
		{
			return create(ObjectUtil.merge(_internal, data is Data ? data.__inernal : data));
		}
		
		
		/**
		 * Attempt to get the value of a property stored in this Data set.
		 * @param name The property name.
		 * @param fallback A fallback value to use if the property does not exist.
		 */
		public function prop(name:String, fallback:* = null):*
		{
			return ObjectUtil.prop(_internal, name, fallback);
		}
		
		
		flash_proxy override function getProperty(name:*):*
		{
			return prop(name);
		}
		
		
		flash_proxy override function setProperty(name:*, value:*):void
		{
			_internal[name] = value;
		}
		
		
		flash_proxy override function hasProperty(name:*):Boolean
		{
			return _internal.hasOwnProperty(name);
		}
		
		
		flash_proxy override function nextNameIndex(index:int):int
		{
			if (index === 0)
			{
				_fields = [];
				for (var field:String in _internal)
				{
					_fields.push(field);
				}
			}
			
			if (index < _fields.length + 1)
			{
				return index + 1;
			}
			else
			{
				return 0;
			}
		}
		
		
		flash_proxy override function nextName(index:int):String
		{
			return _fields[index - 1];
		}
		
		
		flash_proxy override function nextValue(index:int):*
		{
			return _internal[_fields[index - 1]];
		}
		
		
		flash_proxy override function deleteProperty(name:*):Boolean
		{
			if (_internal.hasOwnProperty(name))
			{
				delete _internal[name];
				return true;
			}
			
			return false;
		}
		
		
		internal function get __internal():Object { return _internal; }
		
	}
	
}