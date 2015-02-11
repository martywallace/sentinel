package sentinel.framework.audio
{
	
	import flash.media.SoundTransform;
	import sentinel.framework.Library;
	import sentinel.framework.events.SoundEvent;
	import sentinel.framework.util.NumberUtil;
	
	
	/**
	 * A group of sounds that can be played (e.g. effects, music).
	 * @author Marty Wallace.
	 */
	internal class AudioGroup
	{
		
		private var _audio:Audio;
		private var _library:Library;
		private var _transform:SoundTransform;
		private var _sounds:Vector.<Sound>;
		
		
		public function AudioGroup(audio:Audio, library:Library)
		{
			_audio = audio;
			_library = library;
			_transform = new SoundTransform();
			_sounds = new <Sound>[];
		}
		
		
		/**
		 * @private
		 */
		internal function __play(asset:String, volume:Number = 1, pan:Number = 0, start:Number = 0, loop:Boolean = false):Sound
		{
			var sound:Sound = _library.getAudio(asset);
			
			sound.addEventListener(SoundEvent.COMPLETE, _soundComplete);
			sound.__play(volume * this.volume, pan * this.pan, start, loop);
			
			_sounds.push(sound);
			
			return sound;
		}
		
		
		private function _soundComplete(event:SoundEvent):void
		{
			// Note: event.sound.removeEventListener(...) not nescessary because its deconstruct()
			// takes care of that for us.
			var index:int = _sounds.indexOf(event.sound);
			
			if (index >= 0)
			{
				_sounds.splice(index, 1);
			}
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
		
		/**
		 * Returns a list of all the current playing Sounds.
		 */
		public function get sounds():Vector.<Sound> { return _sounds; }
		
	}
	
}