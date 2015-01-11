package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.graphics.Viewport;
	import sentinel.framework.util.GraphicsUtil;
	import starling.text.TextField;
	
	
	public class TextField extends starling.text.TextField implements IGraphicsContainer
	{
		
		private var _extender:Extender;
		
		
		public function TextField(width:int, height:int, text:String, fontName:String = 'Verdana', fontSize:int = 12, color:uint = 0, bold:Boolean = false)
		{
			_extender = new Extender(this);
			super(width, height, text, fontName, fontSize, color, bold);
		}
		
		
		public function deconstruct():void
		{
			_extender.deconstruct();
		}
		
		
		public function sortChildrenByDepth():void
		{
			_extender.__sortChildrenByDepth();
		}
		
		
		public function addTo(target:IGraphicsContainer):void
		{
			_extender.__addTo(target);
		}
		
		
		public function get viewport():Viewport { return _extender.__viewport; }
		
		public function get depth():int { return _extender.__depth; }
		public function set depth(value:int):void { _extender.__depth = value; }
		
		public function get autoSort():Boolean { return _extender.__autoSort; }
		public function set autoSort(value:Boolean):void { _extender.__autoSort = value; }
		
		public function get atZero():Boolean { return _extender.__atZero; }
		
	}
	
}