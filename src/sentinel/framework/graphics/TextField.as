package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.text.TextField;
	
	
	public class TextField extends starling.text.TextField implements IGraphicsContainer
	{
		
		public function TextField(width:Number, height:Number, text:String, fontName:String = 'Verdana', fontSize:int = 12, color:uint = 0x000000, bold:Boolean = false)
		{
			super(width, height, text, fontName, fontSize, color, bold);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
		}
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}