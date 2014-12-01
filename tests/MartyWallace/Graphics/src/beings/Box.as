package beings
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.scene.Being;
	
	
	public class Box extends Being
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImage('box');
			
			graphics.alignPivot();
			graphics.depth = y;
			graphics.scaleX = graphics.scaleY = 0.5 + Math.random() * 0.5;
			
			return graphics;
		}
		
		
		protected override function update():void
		{
			rotation += 0.01;
		}
		
	}
	
}