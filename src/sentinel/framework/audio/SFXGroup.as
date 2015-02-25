package sentinel.framework.audio
{
	
	import sentinel.framework.Library;
	
	
	/**
	 * The AudioGroup responsible for playing sound effects within the game (explosions, gunshots,
	 * picking up objects, etc).
	 * @author Marty Wallace.
	 */
	public class SFXGroup extends AudioGroup
	{
		
		public function SFXGroup(audio:Audio, library:Library)
		{
			super(audio, library);
		}
		
		
		/**
		 * Plays a sound effect.
		 * @param asset The name of the asset to play.
		 * @param volume The sound volume.
		 * @param pan The left to right panning of the sound.
		 */
		public function play(asset:String, volume:Number = 1, pan:Number = 0):Channel
		{
			return __play(asset, volume, pan);
		}
		
	}
	
}