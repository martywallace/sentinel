package sentinel.base
{
	
	import sentinel.contracts.IConstructs;
	import sentinel.contracts.IUpdates;
	import sentinel.contracts.IDeconstructs;
	import sentinel.user.Viewport;
	import sentinel.user.Mouse;
	import sentinel.user.Keyboard;
	
	import starling.core.Starling;
	
	
	public class Thing implements IConstructs, IUpdates, IDeconstructs
	{
		
		public function Thing()
		{
			construct();
		}
		
		
		public function construct():void
		{
			//
		}
		
		
		public function update():void
		{
			//
		}
		
		
		public function deconstruct():void
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