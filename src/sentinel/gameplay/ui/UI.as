package sentinel.gameplay.ui
{
	
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.Thing;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	
	
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
		
		
		protected final override function added(thing:Thing):void
		{
			if (!(thing is GameplayState)) throw new Error("UI can only be added to GameplayState.");
		}
		
		
		protected final override function removed(thing:Thing):void
		{
			if (!(thing is GameplayState)) throw new Error("UI can only be removed from GameplayState.");
		}
		
		
		/**
		 * TODO: Throws null exception after the GameplayState has been exited and re-entered?
		 */
		public function get world():World { return (parent as GameplayState).world; }
		
		public function get graphics():IGraphicsContainer { return _graphics; }
		
	}
	
}