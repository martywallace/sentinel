package sentinel.framework.client
{
	
	import flash.net.SharedObject;
	import sentinel.framework.Service;
	import sentinel.framework.Data;
	
	
	/**
	 * Local storage via SharedObject.
	 * @author Marty Wallace.
	 */
	public class Storage extends Service
	{
		
		private var _block:uint = 1;
		private var _so:SharedObject;
		
		
		protected override function construct():void
		{
			_so = SharedObject.getLocal(game.identity.replace(/[^\w\/]/, ''));
		}
		
		
		public function save(field:String, data:Data):void
		{
			_data.set(field, data.raw);
		}
		
		
		public function load(field:String, fallback:* = null):Data
		{
			return Data.create(_data.get(field, fallback));
		}
		
		
		public function empty():void
		{
			_so.data[blockName] = { };
		}
		
		
		private function get _data():Data
		{
			if (!_so.data.hasOwnProperty(blockName)) _so.data[blockName] = new Data();
			if (!(_so.data[blockName] is Data)) _so.data[blockName] = Data.create(_so.data[blockName]);
			
			return _so.data[blockName];
		}
		
		
		public function set block(value:uint):void { _block = value; }
		public function get block():uint { return _block; }
		public function get blockName():String { return '_block' + block; }
		
		public override function get name():String { return 'storage'; }
		
	}
	
}