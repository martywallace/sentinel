package sentinel.framework.audio
{
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	
	/**
	 * A Sound managed by the Audio component.
	 * @author Marty Wallace.
	 */
	public class Sound
	{
		
		private var _base:flash.media.Sound;
		private var _transform:SoundTransform;
		private var _channel:SoundChannel;
		
		
		public function Sound(asset:flash.media.Sound)
		{
			_base = asset;
		}
		
		
		internal function __play(volume:Number = 1, panning:Number = 0, startTime:Number = 0, loop:Boolean = false):void
		{
			_transform = new SoundTransform(volume, panning);
			_channel = _base.play(startTime, loop ? 999 : 0, _transform);
		}
		
		
		public function stop():void
		{
			_channel.stop();
		}
		
		
		public function get volume():Number { return _transform.volume; }
		
		public function set volume(value:Number):void
		{
			_transform.volume = value;
			_channel.soundTransform = _transform;
		}
		
		public function get pan():Number { return _transform.pan; }
		
		public function set pan(value:Number):void
		{
			_transform.pan = value;
			_channel.soundTransform = _transform;
		}
		
		public function get position():Number { return _channel.position; }
		
	}
	
}