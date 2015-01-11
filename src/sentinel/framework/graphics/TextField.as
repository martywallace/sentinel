package sentinel.framework.graphics
{
	
	import sentinel.framework.graphics.Viewport;
	import sentinel.gameplay.physics.Vector2D;
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
		
		
		public function toGlobalVector(local:Vector2D):Vector2D { return _extender.__toGlobalVector(local); }
		
		public function toLocalVector(global:Vector2D):Vector2D { return _extender.__toLocalVector(global); }
		
		
		public function get viewport():Viewport { return _extender.__viewport; }
		
		public function get depth():int { return _extender.__depth; }
		public function set depth(value:int):void { _extender.__depth = value; }
		
		public function get autoSort():Boolean { return _extender.__autoSort; }
		public function set autoSort(value:Boolean):void { _extender.__autoSort = value; }
		
		public function get atZero():Boolean { return _extender.__atZero; }
		
	}
	
}