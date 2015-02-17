package sentinel.framework.audio
{
	
	import sentinel.framework.Library;
	
	
	public class SFXGroup extends AudioGroup
	{
		
		public function SFXGroup(audio:Audio, library:Library)
		{
			super(audio, library);
		}
		
		
		public function play(asset:String, volume:Number = 1, pan:Number = 0):Channel
		{
			return __play(asset, volume, pan);
		}
		
	}
	
}