package sentinel.framework
{
	
	/**
	 * A contract defining an object that can be associated with one or more Services. Typically, a
	 * ServiceManager will be used to manage that relationship.
	 * @author Marty Wallace.
	 */
	public interface IServiceable
	{
		
		/**
		 * Returns a Service that is servicing this object.
		 * @param serviceName The name of the Service, represented by its 'name' getter.
		 * 
		 * @csharp Improvement opportunity: public T GetService(string name) where T : new(), Service.
		 */
		function getService(name:String):Service;
		
	}
	
}