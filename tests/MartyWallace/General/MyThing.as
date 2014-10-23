package
{
	import sentinel.base.Thing;
	import sentinel.events.MEvent;
	
	public class MyThing extends Thing
	{
		
		public function MyThing()
		{
			mouse.addEventListener(MEvent.LEFT_DOWN, _leftDown);
		}
		
		
		private function _leftDown(e:MEvent):void
		{
			trace(mouse.getState());
		}
		
	}
	
}