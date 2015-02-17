package sentinel.framework
{
	
	/**
	 * Describes an asset that can be stored in and loaded from the game Library.
	 * @author Marty Wallace.
	 */
	public interface ILibraryAsset
	{
		
		/**
		 * Describes the type of asset (e.g. texture, sound).
		 */
		function get type():String;
		
	}
	
}