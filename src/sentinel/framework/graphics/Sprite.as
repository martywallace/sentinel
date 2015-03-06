package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import sentinel.framework.util.GraphicsUtil;
	
	
	public class Sprite extends starling.display.Sprite implements IGraphicsContainer
	{
		
		private var _depth:int = 0;
		private var _autoSort:Boolean = false;
		
		
		public function Sprite(autoSort:Boolean = false)
		{
			super();
			_autoSort = autoSort;
		}
		
		
		public function addTo(target:DisplayObjectContainer):void
		{
			target.addChild(this);
		}
		
		
		public function deconstruct():void
		{
			removeFromParent(true);
		}
		
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			if (_autoSort)
			{
				sortChildrenByDepth();
			}
			
			return super.addChild(child);
		}
		
		
		public function sortChildrenByDepth():void
		{
			GraphicsUtil.sortChildrenByDepth(this);
		}
		
		
		public function get depth():int { return _depth; }
		
		public function set depth(value:int):void
		{
			_depth = value;
			
			if (parent && (parent as IGraphicsContainer).autoSort)
			{
				(parent as IGraphicsContainer).sortChildrenByDepth();
			}
		}
		
		public function get autoSort():Boolean { return _autoSort; }
		public function set autoSort(value:Boolean):void { _autoSort = value; }
		
		public function get atZero():Boolean { return x === 0 && y === 0 && rotation === 0; }
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}