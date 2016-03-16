package sentinel.framework.client {
	
	import flash.net.SharedObject;
	
	import sentinel.framework.errors.FrameworkError;
	
	/**
	 * The storage class assists with saving and loading data via Shared Objects.
	 * 
	 * @author Marty Wallace
	 */
	public class Storage {
		
		public static const DEFAULT_SLOT:uint = 0;
		
		private var _so:SharedObject;
		private var _collection:String;
		private var _slot:uint = DEFAULT_SLOT;
		
		public function toString():String {
			if (collection !== null) {
				return JSON.stringify(_so.data);
			} else {
				return JSON.stringify({ });
			}
		}
		
		/**
		 * Save some data to the current collection block.
		 * 
		 * @param name Name to store data against.
		 * @param data The data.
		 */
		public function save(name:String, data:*):void {
			if (collection !== null) {
				_data[name] = data;
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
				if (_data.hasOwnProperty(name)) {
					return _data[name];
				}
			} else {
				throw FrameworkError.compile('You cannot save or load data without defining a collection first.');
			}
				
			return fallback;
		}
		
		/**
		 * Clear saved data.
		 * 
		 * @param collection The collection to clear. If not specified, all data from all
		 * collections is cleared.
		 * @param slot The block within the collection to clear.
		 */
		public function clear(collection:String = null, slot:uint = DEFAULT_SLOT):void {
			if (collection !== null) {
				if (_so.data.hasOwnProperty(collection)) {
					delete _so.data[collection][slot];
				}
			} else {
				_so.clear();
			}
		}
		
		/** The current collection name. */
		public function get collection():String { return _collection; }
		
		public function set collection(value:String):void {
			_collection = value.replace(/[^\w]+/, '');
			_so = SharedObject.getLocal(_collection);
		}
		
		/** The current slot number. */
		public function get slot():uint { return _slot; }
		public function set slot(value:uint):void { _slot = value; }
		
		private function get _data():Object {
			if (!_so.data.hasOwnProperty(collection)) {
				_so.data[collection] = { };
			}
			
			if (!_so.data[collection].hasOwnProperty(slot)) {
				_so.data[collection][slot] = { };
			}
			
			return _so.data[collection][slot];
		}
		
	}
	
}