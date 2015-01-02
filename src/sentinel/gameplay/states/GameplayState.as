package sentinel.gameplay.states
{
	
	import sentinel.framework.State;
	import sentinel.gameplay.world.BaseWorld;
	import sentinel.gameplay.ui.BaseUI;
	import starling.display.DisplayObject;
	
	
	/**
	 * The GameplayState is the base class for your gameplay logic. It is responsible for initializing
	 * a World and a UI, as well as bridging the two.
	 * @author Marty Wallace.
	 */
	public class GameplayState extends State
	{
		
		private var _world:BaseWorld;
		private var _ui:BaseUI;
		
		
		public function GameplayState(world:BaseWorld, ui:BaseUI)
		{
			super();
			
			_world = world;
			_ui = ui;
			
			addT(_world);
			addT(_ui);
			
			graphics.addChild(_world.graphics as DisplayObject);
			graphics.addChild(_ui.graphics as DisplayObject);
		}
		
		
		public override function deconstruct():void
		{
			// World and UI are deconstrcuted automatically, as descendant Things.
			// ...
			
			super.deconstruct();
		}
		
		
		public function get world():BaseWorld { return _world; }
		public function get ui():BaseUI { return _ui; }
		
	}
	
}