package ui
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.TextField;
	import sentinel.gameplay.ui.UIElement;
	
	
	public class Counter extends UIElement
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:TextField = new TextField(viewport.width, 100, '', 'Verdana', 20, 0xFFFFFF, true);
			graphics.y = viewport.height - graphics.height;
			
			return graphics;
		}
		
		
		protected override function update():void
		{	
			(graphics as TextField).text = world.totalBeings.toString();
		}
		
	}
	
}