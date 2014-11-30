package sentinel.testing.states
{
	
	import sentinel.framework.State;
	import sentinel.testing.ui.TestMenuButton;
	
	
	/**
	 * A test menu state, providing a way to easily create some buttons quickly for a test only or
	 * temporary gam menu.
	 * @author Marty Wallace.
	 */
	public class TestMenu extends State
	{
		
		private var _buttons:Vector.<TestMenuButton>;
		
		
		public function TestMenu()
		{
			super();
			
			//
		}
		
		
		public function setButtons(buttons:Vector.<TestMenuButton>):void
		{
			if (_buttons === null)
			{
				_buttons = new <TestMenuButton>[];
				
				var ypos:int = viewport.height - 100;
				
				while (buttons.length > 0)
				{
					var button:TestMenuButton = buttons.pop();
					
					button.graphics.x = viewport.center.x;
					button.graphics.y = ypos;
					
					addT(button);
					graphics.addChild(button.graphics);
					
					_buttons.push(button);
					
					ypos -= (button.graphics.height + 10);
				}
			}
			
			else throw new Error("Buttons have already been defined for this TestMenu.");
		}
		
	}
	
}