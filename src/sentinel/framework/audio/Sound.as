package sentinel.framework.audio
{
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import sentinel.framework.events.EventDispatcher;
	import sentinel.framework.events.SoundEvent;
	
	
	/**
	 * A Sound managed by the Audio component.
	 * @author Marty Wallace.
	 */
	public class Sound extends EventDispatcher
	{
		
		private var _base:flash.media.Sound;
		private var _transform:SoundTransform;
		private var _channel:SoundChannel;
		
		
		public function Sound(asset:flash.media.Sound)
		{
			_base = asset;
		}
		
		
		public override function deconstruct():void
		{
			// TODO: Does anything need to be done here?
			// ...
			
			super.deconstruct();
		}
		
		
		internal function __play(volume:Number = 1, panning:Number = 0, startTime:Number = 0, loop:Boolean = false):void
		{
			_transform = new SoundTransform(volume, panning);
			
			_channel = _base.play(startTime, loop ? 999 : 0, _transform);
			_channel.addEventListener(Event.SOUND_COMPLETE, _complete);
		}
		
		
		public function stop():void
		{
			_channel.stop();
			_dispatchEvent(SoundEvent.STOPPED);
		}
		
		
		private function _complete(event:Event):void
		{
			(event.target as SoundChannel).removeEventListener(Event.COMPLETE, _complete);
			_dispatchEvent(SoundEvent.COMPLETE);
		}
		
		
		private function _dispatchEvent(type:String):void
		{
			if (hasEventListener(type))
			{
				dispatchEvent(new SoundEvent(type));
			}
		}
		
		
		internal function get __base():flash.media.Sound { return _base; }
		
		
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