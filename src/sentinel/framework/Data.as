package sentinel.framework
{
	
	import sentinel.framework.util.ObjectUtil;
	
	
	/**
	 * General data storage.
	 * @author Marty Wallace.
	 */
	public dynamic class Data
	{
		
		public static function fromJson(json:String):Data
		{
			return new Data(JSON.parse(json));
		}
		
		
		public function Data(base:Object = null)
		{
			if (base !== null)
			{
				for (var prop:String in base)
				{
					this[prop] = base[prop];
				}
			}
		}
		
		
		public function copy():Data
		{
			return new Data(ObjectUtil.shallowCopy(this));
		}
		
		
		public function merge(data:Object):Data
		{
			var copy:Data = copy();
			
			for (var prop:String in data)
			{
				copy[prop] = data[prop];
			}
			
			return copy;
		}
		
		
		public function prop(name:String, fallback:* = null):*
		{
			return hasOwnProperty(name) ? this[name] : fallback;
		}
		
		
		public function toJson():String
		{
			return JSON.stringify(this);
		}
		
		
		public function get totalProperties():int { return ObjectUtil.countProperties(this); }
		
	}
	
}