package sentinel.framework.audio
{
	
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import sentinel.framework.ILibraryAsset;
	import sentinel.framework.Library;
	
	
	/**
	 * A Sound asset stored in the game library.
	 * @author Marty Wallace.
	 */
	public class Sound implements ILibraryAsset
	{
		
		private var _base:flash.media.Sound;
		
		
		public function Sound(asset:flash.media.Sound)
		{
			_base = asset;
		}
		
		
		internal function __play(volume:Number = 1, panning:Number = 0, startTime:Number = 0, loop:Boolean = false):Channel
		{
			var transform:SoundTransform = new SoundTransform(volume, panning);
			return new Channel(_base.play(startTime, loop ? 999 : 0, transform), transform);
		}
		
		
		internal function get __base():flash.media.Sound { return _base; }
		
		public function get assetType():String { return Library.AUDIO; }
		
	}
	
}