package sentinel.framework.audio
{
	
	import sentinel.framework.Library;
	
	
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
				// Don't let a MusicGroup play two things at the same time.
				_current.stop();
			}
			
			_current = __play(asset, volume, pan, start, loop);
		}
		
		
		// TODO: Once we get greensock in here, lets implement a way to transition between two tracks.
		// ...
		
		
		public function get current():Channel { return _current; }
		
	}
	
}