package sentinel.framework.client {
	
	import flash.net.SharedObject;
	import sentinel.framework.errors.FrameworkError;
	
	/**
	 * The storage class assists with saving and loading data via Shared Objects.
	 * 
	 * @author Marty Wallace
	 */
	public class Storage {
		
		private var _so:SharedObject;
		private var _collection:String;
		private var _block:uint = 1;
		
		public function toString():String {
			return JSON.stringify(_so.data);
		}
		
		/**
		 * Save some data to the current collection block.
		 * 
		 * @param name Name to store data against.
		 * @param data The data.
		 */
		public function save(name:String, data:*):void {
			if (collection !== null) {
				_slot[name] = data;
			} else {
				throw FrameworkError.compile('You cannot save or load data without defining a collection first.');
			}
		}
		
		/**
		 * Load some data from the current collection block.
		 * 
		 * @param name The name of the data to load.
		 * @param fallback A fallback value to use if the data was not found.
		 */
		public function load(name:String, fallback:* = null):* {
			if (collection !== null) {
				if (_slot.hasOwnProperty(name)) {
					return _slot[name];
				}
			} else {
				throw FrameworkError.compile('You cannot save or load data without defining a collection first.');
			}
				
			return fallback;
		}
		
		/** The current collection name. */
		public function get collection():String { return _collection; }
		
		public function set collection(value:String):void {
			_collection = value.replace(/[^\w]+/, '');
			_so = SharedObject.getLocal(_collection);
		}
		
		/** The current block number. */
		public function get block():uint { return _block; }
		public function set block(value:uint):void { _block = value; }
		
		private function get _slot():Object {
			if (!_so.data.hasOwnProperty(collection)) {
				_so.data[collection] = { };
			}
			
			if (!_so.data[collection].hasOwnProperty(block)) {
				_so.data[collection][block] = { };
			}
			
			return _so.data[collection][block];
		}
		
	}
	
}