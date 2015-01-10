package sentinel.framework.graphics
{
	
	import sentinel.framework.events.EventDispatcher;
	import sentinel.framework.IDeconstructs;
	import sentinel.gameplay.physics.Vector2D;
	import starling.display.DisplayObject;
	
	
	internal class Graphics extends EventDispatcher implements IGraphics
	{
		
		private var _base:DisplayObject;
		private var _depth:Number = 0;
		
		
		public function deconstruct():void
		{
			removeEventListeners();
			
			_base.removeEventListeners();
			_base.removeFromParent(true);
		}
		
		
		public function localToGlobal(local:Vector2D):Vector2D
		{
			// TODO.
			return new Vector2D();
		}
		
		
		public function globalToLocal(global:Vector2D):Vector2D
		{
			// TODO.
			return new Vector2D();
		}
		
		
		public function get x():Number { return _base.x; }
		public function set x(value:Number):void { _base.x = value; }
		
		public function get y():Number { return _base.y; }
		public function set y(value:Number):void { _base.y = value; }
		
		public function get rotation():Number { return _base.rotation; }
		public function set rotation(value:Number):void { _base.rotation = value; }
		
		public function get width():Number { return _base.width; }
		public function set width(value:Number):void { _base.width = value; }
		
		public function get height():Number { return _base.height; }
		public function set height(value:Number):void { _base.height = value; }
		
		public function get scaleX():Number { return _base.scaleX; }
		public function set scaleX(value:Number):void { _base.scaleX = value; }
		
		public function get scaleY():Number { return _base.scaleY; }
		public function set scaleY(value:Number):void { _base.scaleY = value; }
		
		public function get pivotX():Number { return _base.pivotX; }
		public function set pivotX(value:Number):void { _base.pivotX = value; }
		
		public function get pivotY():Number { return _base.pivotY; }
		public function set pivotY(value:Number):void { _base.pivotY = value; }
		
		public function get skewX():Number { return _base.skewX; }
		public function set skewX(value:Number):void { _base.skewX = value; }
		
		public function get skewY():Number { return _base.skewY; }
		public function set skewY(value:Number):void { _base.skewY = value; }
		
		public function get visible():Boolean { return _base.visible; }
		public function set visible(value:Number):void { _base.visible = value; }
		
		public function get depth():Number { return _depth; }
		public function set depth(value:Number):void { _depth = value; }
		
		public function get parent():GraphicsContainer { return null; }
		
		internal function get __base():DisplayObject { return _base; }
		
	}
	
}