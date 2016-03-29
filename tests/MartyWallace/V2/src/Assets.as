package {
	
	import sentinel.framework.LibraryBundle;
	
	public class Assets extends LibraryBundle {
		[Embed(source="../assets.zip", mimeType="application/octet-stream")]
		private var _data:Class;
		
		public function Assets() {
			super(new _data());
		}
	}
	
}