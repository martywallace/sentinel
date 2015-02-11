package sentinel.framework.audio
{
	
	import sentinel.framework.Service;
	
	
	/**
	 * The Audio class assists with playing audio in your game.
	 * @author Marty Wallace.
	 */
	public class Audio extends Service
	{
		
		private var _sfx:AudioGroup;
		private var _music:AudioGroup;
		
		
		protected override function construct():void
		{
			_sfx = new AudioGroup(this, library);
			_music = new AudioGroup(this, library);
		}
		
		
		/**
		 * The AudioGroup responsible for playing sound effects.
		 */
		public function get sfx():AudioGroup { return _sfx; }
		
		/**
		 * The AudioGroup responsible for playing background music.
		 */
		public function get music():AudioGroup { return _music; }
		
		
		public override function get name():String { return 'audio'; }
		
	}
	
}