package sentinel.graphics
{
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	
	public class Sprite extends starling.display.Sprite implements IGraphics
	{
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			if (child === null)
			{
				// Ignore this call.
				return null;
			}
			
			return super.addChild(child);
		}
		
	}
	
}