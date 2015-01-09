package sentinel.gameplay.world
{
	
	/**
	 * An interface used to represent a unique Being within a World.
	 * @author Marty Wallace.
	 */
	public interface IUnique extends IQueryable
	{
		
		/**
		 * A unique name representing the Being this contract is attached to.
		 */
		function get uniqueName():String;
		
	}
	
}