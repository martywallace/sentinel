package sentinel.framework.audio
{
	
	import sentinel.framework.Service;
	
	
	/**
	 * The Audio class assists with playing audio in your game.
	 * @author Marty Wallace.
	 */
	public class Audio extends Service
	{
		
		private var _sfx:SFXGroup;
		private var _music:MusicGroup;
		
		
		protected override function construct():void
		{
			_sfx = new SFXGroup(this, library);
			_music = new MusicGroup(this, library);
		}
		
		
		/**
		 * The AudioGroup responsible for playing sound effects.
		 */
		public function get sfx():SFXGroup { return _sfx; }
		
		/**
		 * The AudioGroup responsible for playing background music.
		 */
		public function get music():MusicGroup { return _music; }
		
		
		public override function get name():String { return 'audio'; }
		
	}
	
}