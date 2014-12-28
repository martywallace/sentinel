package sentinel.framework
{
	
	/**
	 * An object that can be saved as an object and loaded from an object.
	 * @author Marty Wallace.
	 */
	public interface IStorable
	{
		
		function save():Data;
		function load(data:Data):void;
		
	}
	
}