package sentinel.base
{
	
	import flash.display.MovieClip;
	import starling.core.Starling;
	
	
	public class Core extends MovieClip
	{
		
		private var _starling:Starling;
		
		
		public function Core(main:Class, antiAliasing:int = 0, debug:Boolean = false)
		{
			_starling = new Starling(main, stage);
			
			_starling.showStats = debug;
			_starling.antiAliasing = antiAliasing;
			_starling.start();
		}
		
	}
	
}