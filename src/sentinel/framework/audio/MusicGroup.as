package sentinel.framework.audio
{
	
	import sentinel.framework.Library;
	
	
	/**
	 * The AudioGroup responsible for playing background music within your game. Background music can
	 * be more easily defined by overriding the <code>backgroundMusic</code> getter on your active
	 * State instance, however this class may be needed to manage multiple instances of background
	 * music for a single state.
	 * @author Marty Wallace.
	 */
	public class MusicGroup extends AudioGroup
	{
		
		private var _current:Channel;
		
		
		public function MusicGroup(audio:Audio, library:Library)
		{
			super(audio, library);
		}
		
		
		public function play(asset:String, volume:Number = 1, pan:Number = 0, start:Number = 0, loop:Boolean = false):void
		{
			if (_current !== null)
			{
				// Don't let a MusicGroup play two things at the same time. Note that deconstructing
				// a channel stops it.
				_current.deconstruct();
			}
			
			_current = __play(asset, volume, pan, start, loop);
		}
		
		
		// TODO: Once we get greensock in here, lets implement a way to transition between two tracks.
		// ...
		
		
		public function get current():Channel { return _current; }
		
	}
	
}