package sentinel.gameplay.states
{
	
	import sentinel.framework.State;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.ui.UI;
	import starling.display.DisplayObject;
	
	
	public class GameplayState extends State
	{
		
		private var _world:World;
		private var _ui:UI;
		
		
		public function GameplayState(world:World, ui:UI)
		{
			super();
			
			_world = world;
			_ui = ui;
			
			add(_world);
			add(_ui);
			
			graphics.addChild(_world.graphics as DisplayObject);
			graphics.addChild(_ui.graphics as DisplayObject);
		}
		
		
		public override function deconstruct():void
		{
			// World and UI are deconstrcuted automatically, as descendant Things.
			// ...
			
			super.deconstruct();
		}
		
		
		public function get world():World { return _world; }
		public function get ui():UI { return _ui; }
		
	}
	
}