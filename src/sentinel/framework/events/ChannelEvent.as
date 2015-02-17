package sentinel.framework.events 
{
	
	import sentinel.framework.audio.Channel;
	import sentinel.framework.audio.Sound;
	
	
	public class ChannelEvent extends Event
	{
		
		public static const COMPLETE:String = 'complete';
		public static const STOPPED:String = 'stopped';
		
		
		public function ChannelEvent(type:String) 
		{
			super(type)
		}
		
		
		public function get channel():Channel { return target as Channel; }
		public function get sound():Sound { return channel.sound; }
		
	}

}