package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.Game;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import sentinel.framework.util.GraphicsUtil;
	
	
	public class Sprite extends starling.display.Sprite implements IGraphics, IGraphicsContainer
	{
		
		private var _depth:int = 0;
		private var _autoSort:Boolean = false;
		
		
		/**
		 * Constructor.
		 * @param autoSort Whether children added to this Sprite should automatically be sorted by
		 * their <code>depth</code> property. Reduces performance.
		 */
		public function Sprite(autoSort:Boolean = false)
		{
			super();
			
			_autoSort = autoSort;
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
		
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			if (child === null)
			{
				// Ignore this call.
				return null;
			}
			
			var child:DisplayObject = super.addChild(child);
			
			if (_autoSort)
			{
				sortChildrenByDepth();
			}
			
			return child;
		}
		
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		
		public function get depth():int { return _depth; }
		public function set depth(value:int):void { _depth = value; }
		
		public function get autoSort():Boolean { return _autoSort; }
		public function get atZero():Boolean { return x === 0 && y === 0 && rotation === 0; }
		
	}
	
}