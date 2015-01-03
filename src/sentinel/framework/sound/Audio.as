package sentinel.framework.sound
{
	
	import flash.media.SoundTransform;
	import sentinel.framework.Service;
	
	
	/**
	 * The Audio class assists with playing audio in your game.
	 * @author Marty Wallace.
	 */
	public class Audio extends Service
	{
		
		private var _sfxTransform:SoundTransform;
		private var _musicTransform:SoundTransform;
		
		
		protected override function construct():void
		{
			_sfxTransform = new SoundTransform();
		}
		
		
		public function sfx(asset:String, volume:Number = 1, panning:Number = 0, startTime:Number = 0):Sound
		{
			var sound:Sound = game.library.getSound(asset);
			sound.__play(volume * sfxVolume, panning * sfxPan, startTime);
			
			return sound;
		}
		
		
		public function music(asset:String, volume:Number = 1, panning:Number = 0, startTime:Number = 0, loop:Boolean = true):Sound
		{
			var sound:Sound = game.library.getSound(asset);
			sound.__play(volume * musicVolume, panning * musicPan, startTime, loop);
			
			return sound;
		}
		
		
		public function get sfxVolume():Number { return _sfxTransform.volume; }
		public function set sfxVolume(value:Number):void { _sfxTransform.volume = value; }
		public function get sfxPan():Number { return _sfxTransform.pan; }
		public function set sfxPan(value:Number):void { _sfxTransform.pan = value; }
		
		public function get musicVolume():Number { return _musicTransform.volume; }
		public function set musicVolume(value:Number):void { _musicTransform.volume = value; }
		public function get musicPan():Number { return _musicTransform.pan; }
		public function set musicPan(value:Number):void { _musicTransform.pan = value; }
		
		
		public override function get name():String { return 'audio'; }
		
	}
	
}