package sentinel.gameplay.ui
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.Thing;
	import sentinel.gameplay.world.World;
	import starling.display.DisplayObject;
	
	
	public class UIElement extends Thing
	{
		
		private var _graphics:IGraphics;
		
		
		public override function deconstruct():void
		{
			if (_graphics !== null) _graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		protected final override function added(ui:Thing):void
		{
			if (ui is UI)
			{
				_graphics = defineGraphics();
				
				if (_graphics !== null)
				{
					// Add the graphics to the UI graphics container.
					(ui as UI).graphics.addChild(_graphics as DisplayObject);
				}
			}
			else
			{
				throw new Error("Instances of UIElement can only be added to UIElement.");
			}
		}
		
		
		protected final override function removed(ui:Thing):void
		{
			if (ui is UI)
			{
				if (_graphics !== null) _graphics.deconstruct();
			}
			else
			{
				throw new Error("Instances of UIElement can only be removed from UIElement.");
			}
		}
		
		
		protected function defineGraphics():IGraphics
		{
			return null;
		}
		
		
		protected function get ui():UI { return parent as UI; }
		protected function get world():World { return ui !== null ? ui.world : null; }
		
		public function get graphics():IGraphics { return _graphics; }
		
	}
	
}