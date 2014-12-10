package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.Game;
	import sentinel.framework.util.GraphicsUtil;
	import starling.core.Starling;
	import starling.text.TextField;
	
	
	public class TextField extends starling.text.TextField implements IGraphicsContainer
	{
		
		private var _depth:int = 0;
		
		
		public function TextField(width:int, height:int, text:String, fontName:String = 'Verdana', fontSize:int = 12, color:uint = 0, bold:Boolean = false)
		{
			super(width, height, text, fontName, fontSize, color, bold);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent();
			dispose();
		}
		
		
		public function sortChildrenByDepth():void
		{
			sortChildren(GraphicsUtil.sortCompareFunction);
		}
		
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		
		public function get depth():int { return _depth; }
		public function set depth(value:int):void { _depth = value; }
		
		public function get autoSort():Boolean { return false; }
		
	}
	
}