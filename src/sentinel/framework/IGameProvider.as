package sentinel.framework {
	
	/**
	 * An object that provides a reference to the main game class.
	 */
	public interface IGameProvider {
		
		/**
		 * A reference to the main game class.
		 */
		function get game():Game;
		
	}
	
}