package  
{
	
	import sentinel.framework.Thing;
	
	
	public class Element extends Thing
	{
		
		public function add(element:Element):Element
		{
			return addT(element) as Element;
		}
		
		
		public function remove(element:Element):void
		{
			removeT(element);
		}
		
		
		public function get owner():Element
		{
			return parent as Element;
		}
		
	}

}