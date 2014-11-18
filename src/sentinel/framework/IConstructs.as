package sentinel.framework
{
	
	/**
	 * A contract for an object with an alternate constructor.
	 * Often used on internal objects who may need to be initialized at a later time, e.g.
	 * <code>sentinel.base.Game</code>.
	 * @author Marty Wallace.
	 */
	public interface IConstructs
	{
		
		function construct():void;
		
	}
	
}