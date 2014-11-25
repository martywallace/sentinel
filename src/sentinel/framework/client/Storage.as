package sentinel.framework.client
{
	
	import flash.net.SharedObject;
	import sentinel.framework.IStorable;
	import sentinel.framework.util.ObjectUtil;
	
	
	/**
	 * Local storage for IStorables via SharedObject.
	 * @author Marty Wallace.
	 */
	public class Storage
	{
		
		private var _name:String;
		private var _sharedObject:SharedObject;
		
		
		public function prepare(name:String):void
		{
			_name = name.replace(/[^\w_\/]/g);
			_sharedObject = SharedObject.getLocal(_name);
		}
		
		
		public function save(field:String, data:Object, slot:int = 1):void
		{
			if (_name !== null)
			{
				getSlot(slot, true)[field] = data;
			}
			
			else throw new Error("You must use Storage.prepare() before you can save data.");
		}
		
		
		public function load(field:String, slot:int = 1):Object
		{
			if (_name !== null)
			{
				if (getSlot(slot) !== null)
				{
					return getSlot(slot)[field];
				}
			}
			
			else throw new Error("You must use Storage.prepare() before you can load data.");
			
			return null;
		}
		
		
		public function getSlot(slot:int, createIfMissing:Boolean = false):Object
		{
			var slotField:String = '_slot' + slot;
			
			if (!_sharedObject.data.hasOwnProperty(slotField))
			{
				if (createIfMissing) _sharedObject.data[slotField] = { };
				else return null;
			}
			
			return _sharedObject.data[slotField];
		}
		
		
		public function get name():String { return _name; }
		
	}
	
}