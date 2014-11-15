package sentinel.environment
{
	
	import sentinel.framework.Thing;
	
	
	public class Being extends Thing
	{
		
		public function Being()
		{
			//
		}
		
		
		public function get world():World { return parent as World; }
		
	}
	
}