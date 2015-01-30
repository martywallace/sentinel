package sentinel.testing.ui
{
	
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.graphics.TextField;
	import sentinel.framework.Thing;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	public class TestMenuButton extends Thing
	{
		
		private var _graphics:Sprite;
		private var _text:String;
		private var _clickHandler:Function;
		
		
		public function TestMenuButton(text:String, clickHandler:Function)
		{
			super();
			
			_text = text;
			_clickHandler = clickHandler;
			
			_graphics = new Sprite();
			
			var textField:TextField = new TextField(120, 40, text);
			var background:Quad = new Quad(120, 40, 0xAAAAAA);
			
			_graphics.addChild(background);
			_graphics.addChild(textField);
			_graphics.alignPivot();
			
			_graphics.addEventListener(TouchEvent.TOUCH, _onTouch);
		}
		
		
		public override function deconstruct():void
		{
			_graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		private function _onTouch(event:TouchEvent):void
		{
			if (event.touches[0].phase === TouchPhase.BEGAN)
			{
				_clickHandler(this);
			}
		}
		
		
		public function get graphics():Sprite { return _graphics; }
		public function get text():String { return _text; }
		
	}
	
}