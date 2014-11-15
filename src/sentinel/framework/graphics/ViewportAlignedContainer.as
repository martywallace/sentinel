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
			_content.x = viewport.width / 2;
			_content.y = viewport.height / 2;
			
			addChild(_content);
		}
		
		
		public override function deconstruct():void
		{
			_content.deconstruct();
			super.deconstruct();
		}
		
		
		public function update():void
		{
			_content.x = viewport.width / 2;
			_content.y = viewport.height / 2;
		}
		
		
		public function get content():Sprite { return _content; }
		
	}
	
}