package sentinel.gameplay.ui
{
	
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.Thing;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	import starling.display.DisplayObject;
	
	
	public class UI extends Thing
	{
		
		private var _graphics:IGraphicsContainer;
		
		
		public function UI()
		{
			_graphics = new Sprite();
		}
		
		
		public override function deconstruct():void
		{
			_graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		public override function add(uiElement:Thing):Thing
		{
			if (uiElement is UIElement) return super.add(uiElement);
			throw new ArgumentError("UI.add() only accepts instances of UIElement.");
			
			return null;
		}
		
		
		public override function remove(uiElement:Thing, destroy:Boolean = false):Thing
		{
			if (uiElement is UIElement) return super.remove(uiElement, destroy);
			throw new ArgumentError("UI.remove() only accepts instances of UIElement.");
			
			return null;
		}
		
		
		/**
		 * If this UI is part of a GameplayState, returns the World associated with that GameplayState.
		 * Else return null.
		 */
		public function get world():World
		{
			if (game.state is GameplayState)
			{
				return (game.state as GameplayState).world;
			}
			
			return null;
		}
		
		
		public function get graphics():IGraphicsContainer { return _graphics; }
		
	}
	
}