package sentinel.framework
{
	
	/**
	 * A contract for an object who updates at a regular interval, typically every frame.
	 * @author Marty Wallace.
	 */
	public interface IUpdates
	{
		
		function update():void;
		
	}
	
}