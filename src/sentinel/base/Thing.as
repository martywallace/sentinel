package sentinel.base
{
	
	import sentinel.contracts.IUpdates;
	import sentinel.user.Viewport;
	import sentinel.user.Mouse;
	import sentinel.user.Keyboard;
	
	import starling.core.Starling;
	
	
	public class Thing implements IUpdates
	{
		
		public function update():void
		{
			//
		}
		
		
		public function get game():Game{ return Starling.current.root as Game; }
		public function get viewport():Viewport{ return game.viewport; }
		public function get mouse():Mouse{ return game.mouse; }
		public function get keyboard():Keyboard{ return game.keyboard; }
		public function get starling():Starling{ return Starling.current; }
		
	}
	
}