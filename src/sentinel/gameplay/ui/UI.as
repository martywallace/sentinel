package sentinel.gameplay.ui
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.IMouseDataProvider;
	import sentinel.framework.Thing;
	import sentinel.gameplay.world.World;
	import sentinel.gameplay.states.GameplayState;
	
	
	/**
	 * The UI is a graphics layer typically on top of the World, most commonly used as the in-game
	 * heads up display (e.g. for displaying health bars, etc).
	 * @author Marty Wallace.
	 */
	public class UI extends Thing implements IMouseDataProvider
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
		
		
		protected final override function addedT(thing:Thing):void
		{
			if ((thing is GameplayState)) added(thing as GameplayState);
			else throw new Error("UI can only be added to GameplayState.");
		}
		
		
		protected function added(to:GameplayState):void
		{
			//
		}
		
		
		protected final override function removedT(thing:Thing):void
		{
			if ((thing is GameplayState)) removed(thing as GameplayState);
			else throw new Error("UI can only be removed from GameplayState.");
		}
		
		
		protected function removed(from:GameplayState):void
		{
			//
		}
		
		
		public function get world():World{ return (parent as GameplayState).world; }
		public function get graphics():IGraphicsContainer { return _graphics; }
		public function get mouseContainer():IGraphics{ return _graphics; }
		
	}
	
}