package sentinel.framework {
	
	/**
	 * An object with a deconstructor.
	 * 
	 * @author Marty Wallace
	 */
	public interface IDeconstructs {
		
		/**
		 * Deconstruct this object. Calling this method should represent the end of the lifetime of
		 * the object.
		 */
		function deconstruct():void;
		
	}
	
}