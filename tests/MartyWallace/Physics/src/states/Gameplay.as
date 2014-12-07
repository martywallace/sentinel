package states
{
	
	import scene.PhysicsWorld;
	import scene.SampleMap;
	import ui.HUD;
	import sentinel.gameplay.events.WorldEvent;
	import sentinel.gameplay.scene.Map;
	import sentinel.testing.states.TestGameplay;
	
	
	public class Gameplay extends TestGameplay
	{
		
		private var _cooldown:int = 0;
		private var _map:Map;
		
		
		public function Gameplay()
		{
			super(new PhysicsWorld(), new HUD());
			
			_map = new SampleMap();
			
			world.loadMap(_map);
			world.addEventListener(WorldEvent.FREEZE, _worldFreezeHandler);
		}
		
		
		private function _worldFreezeHandler(event:WorldEvent):void
		{
			// A good place to set up a pause menu.
			storage.save('world', _map.save());
		}
		
		
		protected override function exit():void
		{
			game.loadState(new Menu());
		}
		
		
		protected override function get backgroundColor():uint { return 0x666666; }
		
	}
	
}