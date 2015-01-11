package sentinel.framework.graphics
{
	
	import sentinel.framework.graphics.Viewport;
	import sentinel.gameplay.physics.Vector2D;
	import starling.display.Image;
	import starling.textures.Texture;
	
	
	public class Image extends starling.display.Image implements IGraphics
	{
		
		private var _extender:Extender;
		
		
		public function Image(texture:Texture)
		{
			_extender = new Extender(this);
			super(texture);
		}
		
		
		public function deconstruct():void
		{
			_extender.deconstruct();
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
		
		public function get atZero():Boolean { return _extender.__atZero; }
		
	}
	
	
}