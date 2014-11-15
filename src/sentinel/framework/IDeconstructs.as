package sentinel.framework
{
	
	/**
	 * A contract for an object defining a deconstructor - code used to aid in correct garbage collection.
	 * @author Marty Wallace.
	 */
	public interface IDeconstructs
	{
		
		function deconstruct():void;
		
	}
	
}