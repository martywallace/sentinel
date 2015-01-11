package sentinel.framework.graphics
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.IDeconstructs;
	import sentinel.gameplay.physics.Vector2D;
	import starling.display.DisplayObject;
	
	
	/**
	 * Adds extension methods to an IGraphics object without having to redefine the correct logic
	 * on each object that implements IGraphics.
	 * @author Marty Wallace.
	 */
	internal class Extender implements IDeconstructs
	{
		
		private var _owner:IGraphics;
		private var _depth:int = 0;
		private var _autoSort:Boolean = false;
		
		
		public function Extender(owner:IGraphics)
		{
			_owner = owner;
		}
		
		
		public function deconstruct():void
		{	
			_owner.removeFromParent();
			_owner.dispose();
		}
		
		
		internal function __sortChildrenByDepth():void
		{
			if (_owner is IGraphicsContainer)
			{
				(_owner as IGraphicsContainer).sortChildren(function(a:IGraphics, b:IGraphics):int
				{
					return a.depth === b.depth ? 0 : (a.depth < b.depth ? -1 : 1);
				});
			}
		}
		
		
		internal function __prepareAddChild(child:DisplayObject):DisplayObject
		{
			if (child !== null && _owner is IGraphicsContainer)
			{
				if (_autoSort)
				{
					// Automatically sort the children based on their depth values.
					__sortChildrenByDepth();
				}
				
				return child;
			}
			
			return null;
		}
		
		
		internal function __addTo(target:IGraphicsContainer):void
		{
			target.addChild(_owner as DisplayObject);
		}
		
		
		internal function __toGlobalVector(local:Vector2D):Vector2D
		{
			return Vector2D.fromPoint(_owner.localToGlobal(local.toPoint()));
		}
		
		
		internal function __toLocalVector(global:Vector2D):Vector2D
		{
			return Vector2D.fromPoint(_owner.globalToLocal(global.toPoint()));
		}
		
		
		internal function get __owner():IGraphics { return _owner; }
		
		internal function get __depth():int { return _depth; }
		internal function set __depth(value:int):void { _depth = value; }
		
		internal function get __autoSort():Boolean { return _autoSort; }
		internal function set __autoSort(value:Boolean):void { _autoSort = value; }
		
		internal function get __atZero():Boolean
		{
			return _owner.x === 0 && _owner.y === 0 && _owner.rotation === 0;
		}
		
		internal function get __viewport():Viewport { return BaseGame.getInstance().viewport; }
		
	}
	
}