package sentinel.framework.client
{
	
	import sentinel.framework.util.ObjectUtil;
	import sentinel.framework.util.StringUtil;
	
	
	public class KeyboardState
	{
		
		private var _keys:Object;
		
		
		public function KeyboardState(keys:Object)
		{
			_keys = keys;
		}
		
		
		public function toString():String
		{
			return StringUtil.toDebugString(["keysDown"], [keysDown]);
		}
		
		
		public function isDown(keyCode:uint):Boolean
		{
			return _keys[keyCode];
		}
		
		
		public function areDown(keys:Vector.<uint>):Boolean
		{
			for each(var i:uint in keys)
			{
				if(!isDown(i)) return false;
			}
			
			return true;
		}
		
		
		public function xAreDown(keys:Vector.<uint>, x:int = 1):Boolean
		{
			var total:int = 0;
			
			for each(var i:uint in keys)
			{
				if(isDown(i)) total ++;
			}
			
			return total >= x;
		}
		
		
		public function get keysDown():int{ return ObjectUtil.countProperties(_keys); }
		
	}
	
}