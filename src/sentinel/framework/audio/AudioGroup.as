package sentinel.framework.audio
{
	
	import flash.media.SoundTransform;
	import sentinel.framework.Library;
	import sentinel.framework.util.NumberUtil;
	
	
	/**
	 * A group of sounds that can be played (e.g. effects, music).
	 * @author Marty Wallace.
	 */
	public class AudioGroup
	{
		
		private var _audio:Audio;
		private var _library:Library;
		private var _transform:SoundTransform;
		
		
		public function AudioGroup(audio:Audio, library:Library)
		{
			_audio = audio;
			_library = library;
			_transform = new SoundTransform();
		}
		
		
		/**
		 * Plays and returns a Sound loaded into the game library.
		 * @param asset The name of the asset within the game library.
		 * @param volume The volume level for the sound - this is multiplied by the volume level of
		 * the AudioGroup playing the sound.
		 * @param pan The left-to-right panning of the sound - this is multiplied by the pan level
		 * of the AudioGroup playing the sound.
		 * @param start The initial position of the sound, in milliseconds.
		 * @param loop Whether or not the sound should loop.
		 */
		public function play(asset:String, volume:Number = 1, pan:Number = 0, start:Number = 0, loop:Boolean = false):Sound
		{
			var sound:Sound = _library.getAudio(asset);
			sound.__play(volume * this.volume, pan * this.pan, start, loop);
			
			return sound;
		}
		
		
		/**
		 * The volume level of sounds played through this group. The volume is between 0 and 1.
		 */
		public function get volume():Number { return _transform.volume; }
		public function set volume(value:Number):void { _transform.volume = NumberUtil.clamp(value, 0, 1); }
		
		/**
		 * The left-to-right panning of the sound. The pan is between -1 for full left and 1 for full right. 
		 */
		public function get pan():Number { return _transform.pan; }
		public function set pan(value:Number):void { _transform.pan = NumberUtil.clamp(value, -1, 1); }
		
	}
	
}