package sentinel.framework {
	import deng.fzip.FZip;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class LibraryBundle {
		private var _zip:FZip;
		
		public function load(resource:ByteArray):void {
			_zip = new FZip();
			_zip.addEventListener(Event.COMPLETE, _complete);
			_zip.loadBytes(resource);
		}
		
		private function _complete(event:Event):void {
			// Do we need this when using loadBytes?
			// ...
		}
		
		public function find(name:String):* {
			return _zip.getFileByName(name).content;
		}
	}
}