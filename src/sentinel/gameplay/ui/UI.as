package sentinel.gameplay.ui
{
	
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.Thing;
	import sentinel.gameplay.world.World;
	import sentinel.gameplay.states.GameplayState;
	
	
	public class UI extends Thing
	{
		
		private var _graphics:IGraphicsContainer;
		
		
		public function UI()
		{
			_graphics = new Sprite(true);
		}
		
		
		public override function deconstruct():void
		{
			_graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		public function add(uiElement:UIElement):UIElement
		{
			return addT(uiElement) as UIElement;
		}
		
		
		public function remove(uiElement:UIElement, destroy:Boolean = false):UIElement
		{
			return removeT(uiElement, destroy) as UIElement;
		}
		
		
		protected final override function added(thing:Thing):void
		{
			if (!(thing is GameplayState)) throw new Error("UI can only be added to GameplayState.");
		}
		
		
		protected final override function removed(thing:Thing):void
		{
			if (!(thing is GameplayState)) throw new Error("UI can only be removed from GameplayState.");
		}
		
		
		public function get world():World{ return (parent as GameplayState).world; }
		public function get graphics():IGraphicsContainer { return _graphics; }
		
	}
	
}