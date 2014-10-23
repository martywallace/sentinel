package sentinel.user
{
	
	import sentinel.util.ObjectUtil;
	
	
	public class KeyboardState
	{
		
		private var _keys:Object;
		
		
		public function KeyboardState(keys:Object)
		{
			_keys = keys;
		}
		
		
		public function keyIsDown(keyCode:uint):Boolean
		{
			return _keys[keyCode];
		}
		
		
		public function keysAreDown(keys:Vector.<uint>):Boolean
		{
			for each(var i:uint in keys)
			{
				if(!keyIsDown(i)) return false;
			}
			
			return true;
		}
		
		
		public function xAreDown(keys:Vector.<uint>, x:int = 1):Boolean
		{
			var total:int = 0;
			
			for each(var i:uint in keys)
			{
				if(keyIsDown(i)) total ++;
			}
			
			return total >= x;
		}
		
		
		public function get keysDown():int{ return ObjectUtil.countProperties(_keys); }
		
	}
	
}