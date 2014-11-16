package
{
	
	import sentinel.framework.graphics.TextField;
	import sentinel.gameplay.ui.UI;
	import starling.display.DisplayObject;
	
	
	public class HUD extends UI
	{
		
		private var _counterTextField:TextField;
		
		
		public function HUD()
		{
			super();
			
			_counterTextField = new TextField(viewport.width, 100, '', 'Verdana', 20, 0xFFFFFF, true);
			_counterTextField.y = viewport.height - _counterTextField.height;
			
			graphics.addChild(_counterTextField as DisplayObject);
		}
		
		
		public override function update():void
		{
			_counterTextField.text = world.numChildren.toString();
			
			super.update();
		}
		
	}
	
}