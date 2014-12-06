package sentinel.framework.sound
{
	
	import sentinel.framework.Component;
	import sentinel.framework.Library;
	
	
	/**
	 * The Audio class assists with playing audio in your game.
	 * @author Marty Wallace.
	 */
	public class Audio extends Component
	{
		
		private var _library:Library;
		
		
		public function Audio(library:Library)
		{
			_library = library;
		}
		
		
		public override function get name():String { return 'audio'; }
		
	}
	
}