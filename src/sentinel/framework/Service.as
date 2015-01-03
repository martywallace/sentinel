package sentinel.framework
{
	
	import sentinel.framework.events.EventDispatcher;
	
	
	/**
	 * Describes a service provided to an IServiceable.
	 * @author Marty Wallace.
	 */
	public class Service extends EventDispatcher
	{
		
		private var _serviceable:IServiceable;
		
		
		internal function __construct(serviceable:IServiceable):void
		{
			_serviceable = serviceable;
			construct();
		}
		
		
		protected function construct():void
		{
			//
		}
		
		
		internal function __update():void
		{
			update();
		}
		
		
		protected function update():void
		{
			//
		}
		
		
		/**
		 * The object being serviced by this Service.
		 */
		protected function get serviceable():IServiceable { return _serviceable; }
		
		/**
		 * A reference to the core game object.
		 */
		public function get game():BaseGame { return BaseGame.getInstance(); }
		
		/**
		 * Returns the name of this service.
		 */
		public function get name():String { return null; }
		
	}
	
}