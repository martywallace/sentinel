package sentinel.framework.events
{
	
	import sentinel.framework.client.Keyboard;
	
	
	/**
	 * Describes an event dispatched by the user's keyboard.
	 * @author Marty Wallace.
	 */
	public class KeyboardEvent extends Event
	{
		
		public static const KEY_PRESSED:String = 'keyPressed';
		public static const KEY_RELEASED:String = 'keyReleased';
		
		
		public function KeyboardEvent(type:String, keyCode:uint)
		{
			super(type, { keyCode: keyCode });
		}
		
		
		public function get keyCode():uint{ return data.keyCode; }
		public function get keyChar():String{ return String.fromCharCode(keyCode); }
		public function get keyboard():Keyboard{ return target as Keyboard; }
		
	}
	
}