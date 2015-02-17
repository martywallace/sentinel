package sentinel.framework.audio
{
	
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import sentinel.framework.events.ChannelEvent;
	import sentinel.framework.events.EventDispatcher;
	import sentinel.framework.util.NumberUtil;
	
	
	/**
	 * A sound channel is the result of playing a Sound stored in the game library. It can be thought
	 * of as a single instance of a sound playing (e.g. if you played the same sound 5 times you would
	 * generate 5 separate Channels representing those sounds being played).
	 * @author Marty Wallace.
	 */
	public class Channel extends EventDispatcher
	{
		
		private var _base:SoundChannel;
		private var _sound:Sound;
		private var _transform:SoundTransform;
		
		
		public function Channel(base:SoundChannel, sound:Sound, transform:SoundTransform)
		{
			_base = base;
			_sound = sound;
			_transform = transform;
			
			_base.addEventListener(Event.SOUND_COMPLETE, _complete);
		}
		
		
		public override function deconstruct():void
		{
			_base.stop();
			_base.removeEventListener(Event.SOUND_COMPLETE, _complete);
			
			super.deconstruct();
		}
		
		
		public function stop():void
		{
			_base.stop();
			_dispatchEvent(ChannelEvent.STOPPED);
		}
		
		
		private function _complete(event:Event):void
		{
			_base.removeEventListener(Event.SOUND_COMPLETE, _complete);
			_dispatchEvent(ChannelEvent.COMPLETE);
		}
		
		
		private function _dispatchEvent(type:String):void
		{
			if (hasEventListener(type))
			{
				dispatchEvent(new ChannelEvent(type));
			}
		}
		
		
		/**
		 * @private
		 */
		internal function get __base():SoundChannel { return _base; }
		
		/**
		 * @private
		 */
		internal function get __transform():SoundTransform { return _transform; }
		
		
		public function get volume():Number { return _transform.volume; }
		public function set volume(value:Number):void
		{
			_transform.volume = NumberUtil.clamp(value, 0, 1);
			_base.soundTransform = _transform;
		}
		
		
		public function get pan():Number { return _transform.pan; }
		public function set pan(value:Number):void
		{
			_transform.pan = NumberUtil.clamp(value, -1, 1);
			_base.soundTransform = _transform;
		}
		
		
		public function get sound():Sound { return _sound; }
		public function get position():Number { return _base.position; }
		
	}
	
}