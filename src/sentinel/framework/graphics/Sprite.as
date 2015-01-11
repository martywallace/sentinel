package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.graphics.Viewport;
	import sentinel.framework.util.GraphicsUtil;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	
	public class Sprite extends starling.display.Sprite implements IGraphics, IGraphicsContainer
	{
		
		private var _extender:Extender;
		
		
		/**
		 * Constructor.
		 * @param autoSort Whether children added to this Sprite should automatically be sorted by
		 * their <code>depth</code> property. Reduces performance.
		 */
		public function Sprite(autoSort:Boolean = false)
		{
			_extender = new Extender(this);
			_extender.__autoSort = autoSort;
			
			super();
		}
		
		
		public function deconstruct():void
		{
			_extender.deconstruct();
		}
		
		
		public function sortChildrenByDepth():void
		{
			_extender.__sortChildrenByDepth();
		}
		
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			var child:DisplayObject = _extender.__prepareAddChild(child);
			if (child !== null) super.addChild(child);
			
			return child;
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