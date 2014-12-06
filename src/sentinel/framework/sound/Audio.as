package sentinel.framework.sound
{
	
	import flash.media.Sound;
	import sentinel.framework.Component;
	
	
	/**
	 * The Audio class assists with playing audio in your game.
	 * @author Marty Wallace.
	 */
	public class Audio extends Component
	{
		
		protected override function construct():void
		{
			//
		}
		
		
		public function play(asset:String):void
		{
			var sound:Sound = game.library.getSound(asset);
			sound.play();
		}
		
		
		public override function get name():String { return 'audio'; }
		
	}
	
}