package sentinel.framework.graphics
{
	
	import sentinel.framework.IUpdates;
	import sentinel.framework.IDeconstructs;
	
	
	public class ViewportAlignedContainer extends Sprite implements IUpdates
	{
		
		private var _content:Sprite;
		
		
		public function ViewportAlignedContainer()
		{
			super();
			
			_content = new Sprite();
			addChild(_content);
			
			update();
		}
		
		
		public override function deconstruct():void
		{
			_content.deconstruct();
			super.deconstruct();
		}
		
		
		public function update():void
		{
			super.x = viewport.width / 2;
			super.y = viewport.height / 2;
		}
		
		
		public function get content():Sprite { return _content; }
		
		public override function get x():Number { return _content.x; }
		public override function set x(value:Number):void { _content.x = value; }
		public override function get y():Number { return _content.y; }
		public override function set y(value:Number):void { _content.y = value; }
		
		public function get alignedX():Number { return super.x; }
		public function get alignedY():Number { return super.y; }
		
	}
	
}