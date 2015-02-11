package sentinel.framework.events 
{
	
	import sentinel.framework.audio.Sound;
	
	
	public class SoundEvent extends Event
	{
		
		public static const COMPLETE:String = 'complete';
		public static const STOPPED:String = 'stopped';
		
		
		public function SoundEvent(type:String) 
		{
			super(type)
		}
		
		
		public function get sound():Sound { return target as Sound; }
		
	}

}