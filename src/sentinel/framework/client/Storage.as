package sentinel.framework.client
{
	
	import flash.net.SharedObject;
	import sentinel.framework.ILoadable;
	import sentinel.framework.ISavable;
	
	
	public class Storage
	{
		
		private var _sharedObject:SharedObject;
		
		
		public function Storage()
		{
			//
		}
		
		
		public function save(slot:int, name:String, data:ISavable):void
		{
			//
		}
		
		
		public function load(slot:int, name:String):ILoadable
		{
			//
		}
		
	}
	
}