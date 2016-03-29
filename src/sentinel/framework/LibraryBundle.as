package sentinel.framework {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import deng.fzip.FZip;
	import deng.fzip.FZipFile;
	
	import starling.textures.Texture;
	
	public class LibraryBundle {
		
		private var _zip:FZip;
		
		public function LibraryBundle(resource:ByteArray) {
			_zip = new FZip();
			_zip.loadBytes(resource);
		}
		
		public function find(name:String):* {
			var file:FZipFile = _zip.getFileByName(name);
			
			if (file !== null) {
				return file.content;
			}
			
			return null;
		}
		
		public function getBitmapData(name:String):BitmapData {
			var data:ByteArray = find(name);
			
			if (data !== null) {
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _complete);
				loader.loadBytes(find(name));
			}
			
			return null;
		}
		
		public function getTexture(name:String):Texture {
			return Texture.fromData(find(name));
		}
		
		private function _complete(event:Event):void {
			Game.getInstance().viewport.nativeDisplay.addChild(event.target.content as Bitmap);
		}
		
	}
	
}