package sentinel.base
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
			_starling.addEventListener(Event.ROOT_CREATED, _ready);
		}
		
		
		private function _ready(event:Event):void
		{
			main.construct();
			
			_starling.start();
			_starling.removeEventListener(Event.ROOT_CREATED, _ready);
		}
		
		
		public function get main():Game{ return _starling.root as Game; }
		
	}
	
}