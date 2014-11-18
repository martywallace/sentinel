package
{
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.graphics.TextField;
	
	public class ButtonBox extends Sprite
	{
		
		public function ButtonBox(text:String, color:uint = 0)
		{
			super();
			
			touchable = true;
			
			addChild(new Quad(120, 50, color));
			addChild(new TextField(120, 50, text));
			
			alignPivot();
		}
		
	}
	
}