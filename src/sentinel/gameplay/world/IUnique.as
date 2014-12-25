package sentinel.gameplay.world
{
	
	/**
	 * An interface used to represent a unique being within a World.
	 * @author Marty Wallace.
	 */
	public interface IUnique extends IQueryable
	{
		
		function get uniqueName():String;
		
	}
	
}