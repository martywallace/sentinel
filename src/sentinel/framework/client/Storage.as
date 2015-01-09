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
		
		
		/**
		 * Save data into the current active block.
		 * @param field The field to assign the data to within the block.
		 * @param data The data to assign.
		 */
		public function save(field:String, data:Data):void
		{
			_data.set(field, data.raw);
		}
		
		
		/**
		 * Load data from the current active block.
		 * @param field The field to load data from within the block.
		 * @param fallback Fallback data to use if the field was not defined on the block.
		 */
		public function load(field:String, fallback:* = null):Data
		{
			var data:Object = _data.get(field, fallback);			
			return data !== null ? Data.create(data) : null;
		}
		
		
		/**
		 * Empty the current block.
		 */
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
		
		
		/**
		 * The current block number.
		 */
		public function get block():uint { return _block; }
		public function set block(value:uint):void { _block = value; }
		
		/**
		 * The name associated with the current block.
		 */
		public function get blockName():String { return '_block' + block; }
		
		/**
		 * The service name.
		 */
		public override function get name():String { return 'storage'; }
		
	}
	
}