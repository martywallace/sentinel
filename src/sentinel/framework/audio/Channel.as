package sentinel.framework.audio
{
	
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import sentinel.framework.events.EventDispatcher;
	import sentinel.framework.util.NumberUtil;
	import sentinel.framework.events.ChannelEvent;
	
	
	public class Channel extends EventDispatcher
	{
		
		private var _base:SoundChannel;
		private var _transform:SoundTransform;
		
		
		public function Channel(base:SoundChannel, transform:SoundTransform)
		{
			_base = base;
			_transform = transform;
		}
		
		
		public override function deconstruct():void
		{
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
		
		
		internal function get __base():SoundChannel { return _base; }
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
		
		
		public function get position():Number { return _base.position; }
		
	}
	
}