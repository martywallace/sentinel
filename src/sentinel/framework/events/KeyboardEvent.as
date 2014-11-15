package sentinel.framework.events
{
	
	import sentinel.framework.client.Keyboard;
	import starling.events.Event;
	
	
	public class KeyboardEvent extends Event
	{
		
		public static const KEY_PRESSED:String = 'KeyPressed';
		public static const KEY_RELEASED:String = 'KeyReleased';
		
		
		private var _keyCode:uint;
		
		
		public function KeyboardEvent(type:String, keyCode:uint)
		{
			_keyCode = keyCode;
			
			super(type);
		}
		
		
		public function get keyCode():uint{ return _keyCode; }
		public function get keyChar():String{ return String.fromCharCode(_keyCode); }
		public function get keyboard():Keyboard{ return target as Keyboard; }
		
	}
	
}