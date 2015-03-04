package sentinel.framework.audio
{
	
	import sentinel.framework.events.ChannelEvent;
	import sentinel.framework.Library;
	import sentinel.framework.util.NumberUtil;
	
	
	/**
	 * A group of sounds that can be played (e.g. effects, music).
	 * @author Marty Wallace.
	 */
	internal class AudioGroup
	{
		
		private var _audio:Audio;
		private var _library:Library;
		private var _volume:Number = 1;
		private var _pan:Number = 0;
		private var _channels:Vector.<Channel>;
		
		
		public function AudioGroup(audio:Audio, library:Library)
		{
			_audio = audio;
			_library = library;
			_channels = new <Channel>[];
		}
		
		
		/**
		 * Stops all active Channels that were played through this group. Reference to those Channels
		 * via <code>channels</code> will be discarded.
		 */
		public function stopAll():void
		{
			for each(var channel:Channel in _channels)
			{
				channel.stop();
			}
			
			_channels = new <Channel>[];
		}
		
		
		/**
		 * @private
		 */
		internal function __play(asset:String, volume:Number = 1, pan:Number = 0, start:Number = 0, loop:Boolean = false):Channel
		{
			var sound:Sound = _library.getSound(asset);
			var channel:Channel = sound.__play(this, volume * _volume, pan * _pan, start, loop);
			
			channel.addEventListener(ChannelEvent.COMPLETE, _channelComplete);
			_channels.push(channel);
			
			return channel;
		}
		
		
		private function _channelComplete(event:ChannelEvent):void
		{
			// Note: event.sound.removeEventListener(...) not nescessary because its deconstruct()
			// takes care of that for us.
			var index:int = _channels.indexOf(event.channel);
			
			if (index >= 0)
			{
				_channels.splice(index, 1);
			}
		}
		
		
		/**
		 * The volume level of sounds played through this group. The volume is between 0 and 1.
		 */
		public function get volume():Number { return _volume; }
		public function set volume(value:Number):void
		{
			_volume = NumberUtil.clamp(value, 0, 1);
		}
		
		/**
		 * The left-to-right panning of the sound. The pan is between -1 for full left and 1 for
		 * full right. 
		 */
		public function get pan():Number { return _pan; }
		public function set pan(value:Number):void
		{
			_pan = NumberUtil.clamp(value, -1, 1);
		}
		
		/**
		 * Returns a list of all the current playing sound channels.
		 */
		public function get channels():Vector.<Channel> { return _channels; }
		
	}
	
}