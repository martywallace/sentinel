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
		private var _group:AudioGroup;
		private var _sound:Sound;
		private var _transform:SoundTransform;
		private var _baseVolume:Number;
		private var _basePan:Number;
		
		
		/**
		 * Internal - use <code>audio.{sfx|music}.play(...)</code> instead.
		 */
		public function Channel(base:SoundChannel, group:AudioGroup, sound:Sound, transform:SoundTransform)
		{
			_base = base;
			_group = group;
			_sound = sound;
			_transform = transform;
			
			_baseVolume = transform.volume;
			_basePan = transform.pan;
			
			_base.soundTransform = transform;
			_base.addEventListener(Event.SOUND_COMPLETE, _complete);
		}
		
		
		public override function deconstruct():void
		{
			_base.stop();
			_base.removeEventListener(Event.SOUND_COMPLETE, _complete);
			
			super.deconstruct();
		}
		
		
		/**
		 * Stops the sound being played through this Channel.
		 */
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
		
		
		/**
		 * The volume level of this Channel in the range 0 to 1. Note that the volume of this Channel
		 * is multiplied by the volume of the AudioGroup responsible for producing it.
		 */
		public function get volume():Number { return _baseVolume; }
		public function set volume(value:Number):void
		{
			_baseVolume = NumberUtil.clamp(value, 0, 1);
			_transform.volume = _baseVolume * _group.volume;
			_base.soundTransform = _transform;
		}
		
		/**
		 * The volume level after applying the volume level of the associated AudioGroup.
		 */
		public function get realVolume():Number { return _transform.volume; }
		
		/**
		 * The left-to-right panning of this Channel in the range -1 to 1. Note that the panning of
		 * this Channel is multiplied by the panning of the AudioGroup responsible for producing it.
		 */
		public function get pan():Number { return _basePan; }
		public function set pan(value:Number):void
		{
			_basePan = NumberUtil.clamp(value, -1, 1);
			_transform.pan = _basePan * _group.pan;
			_base.soundTransform = _transform;
		}
		
		/**
		 * The left-to-right panning after applying the left-to-right panning of the associated
		 * AudioGroup.
		 */
		public function get realPan():Number { return _transform.pan; }
		
		/**
		 * The AudioGroup responsible for producing this Channel.
		 */
		public function get group():AudioGroup { return _group; }
		
		/**
		 * The Sound asset being played through this Channel.
		 */
		public function get sound():Sound { return _sound; }
		
		/**
		 * The current playhead position of the Channel, in milliseconds.
		 */
		public function get position():Number { return _base.position; }
		
	}
	
}