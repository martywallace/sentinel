package
{
	
	import sentinel.framework.State;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	public class Menu extends State
	{
		
		private var _playBtn:ButtonBox;
		
		
		public function Menu()
		{
			super();
			
			_playBtn = new ButtonBox('Play', 0xFF0000);
			graphics.addChild(_playBtn);
			
			_playBtn.x = viewport.middleX;
			_playBtn.y = viewport.height - 160;
			
			_playBtn.addEventListener(TouchEvent.TOUCH, _play);
		}
		
		
		public override function deconstruct():void
		{
			_playBtn.deconstruct();
			
			super.deconstruct();
		}
		
		
		private function _play(event:TouchEvent):void
		{
			if (event.touches[0].phase === TouchPhase.BEGAN)
			{
				game.loadState(new Gameplay());
			}
		}
		
	}
	
}