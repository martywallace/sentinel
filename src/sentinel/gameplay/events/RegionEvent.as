package sentinel.gameplay.events
{
	
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.Region;
	import starling.events.Event;
	
	
	public class RegionEvent extends Event
	{
		
		public static const ENTER:String = 'enter';
		public static const EXIT:String = 'exit';
		
		
		private var _being:Being;
		
		
		public function RegionEvent(type:String, being:Being)
		{
			super(type);
			
			_being = being;
		}
		
		
		public function get region():Region { return target as Region; }
		public function get being():Being { return _being; }
		
	}
	
}