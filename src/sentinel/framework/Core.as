package sentinel.framework
{
	
	import flash.display.MovieClip;
	import starling.core.Starling;
	import starling.events.Event;
	
	
	public class Core extends MovieClip
	{
		
		private var _starling:Starling;
		
		
		public function Core(main:Class, antiAliasing:int = 0, debug:Boolean = false)
		{
			_starling = new Starling(main, stage);
			
			_starling.showStats = debug;
			_starling.antiAliasing = antiAliasing;
			_starling.addEventListener(Event.ROOT_CREATED, _rootCreated);
		}
		
		
		private function _rootCreated(event:Event):void
		{
			if (_starling.root is Game)
			{				
				_starling.removeEventListener(Event.ROOT_CREATED, _rootCreated);
				_starling.start();
				
				(_starling.root as Game).construct();
			}
			else
			{
				throw new Error("The class provided to Core() must extend sentinel.base.Game.");
			}
		}
		
	}
	
}