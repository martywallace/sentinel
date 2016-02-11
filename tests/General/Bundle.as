package {
	import sentinel.framework.LibraryBundle;
	
	public class Bundle extends LibraryBundle {
		[Embed(source = "./assets.zip", mimeType = "application/octet-stream")]
		private var _zip:Class;
		
		public function Bundle() {
			load(new _zip());
			
			trace(find('test.txt'));
		}
	}
}