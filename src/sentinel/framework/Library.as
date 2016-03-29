package sentinel.framework {
	
	import sentinel.framework.errors.FrameworkError;
	
	/**
	 * The Library manages game assets e.g. textures, sprite sheets and sound.
	 * 
	 * @author Marty Wallace
	 */
	public class Library {
		
		private var _bundles:Object = { };
		
		public function store(name:String, bundle:LibraryBundle):void {
			if (!_bundles.hasOwnProperty(name)) {
				_bundles[name] = bundle;
			} else {
				throw FrameworkError.compile('A bundle named {{ bundle }} already exists.', { bundle: name });
			}
		}
		
		public function getBundle(name:String):LibraryBundle {
			return _bundles.hasOwnProperty(name) ? _bundles[name] : null;
		}
		
	}
	
}