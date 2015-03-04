package sentinel.framework
{
	
	import sentinel.framework.errors.FrameworkError;
	
	
	/**
	 * Manages the relationship between a collection of Services and an IServiceable.
	 * @author Marty Wallace.
	 */
	public class ServiceManager implements IDeconstructs
	{
		
		private var _constructed:Boolean = false;
		private var _serviceable:IServiceable;
		private var _services:Vector.<Service>;
		private var _servicesMap:Object;
		
		
		/**
		 * Constructor.
		 * @param serviceable The object to be serviced.
		 */
		public function ServiceManager(serviceable:IServiceable, services:Vector.<Service>)
		{
			_serviceable = serviceable;
			_services = services;
			_servicesMap = { };
			
			for each(var service:Service in services)
			{
				if (service.name !== null)
				{
					if (!_servicesMap.hasOwnProperty(service.name))
					{
						_servicesMap[service.name] = service;
					}
					else
					{
						throw FrameworkError.compile('Service named {{ service }} already exists.', {
							service: service.name
						});
					}
				}
				else
				{
					throw FrameworkError.compile('Services must have a name.');
				}
			}
		}
		
		
		/**
		 * Construct all of the Services added to this ServiceManager.
		 */
		public function construct():void
		{
			if (!_constructed)
			{
				// Initialize Services after they have all been added to the manager.
				for each(var service:Service in _services)
				{
					service.__construct(_serviceable);
				}
				
				_constructed = true;
			}
		}
		
		
		/**
		 * Deconstruct this ServiceManager and all of the Services it manages.
		 */
		public function deconstruct():void
		{
			for each(var service:Service in _services)
			{
				service.deconstruct();
			}
			
			_serviceable = null;
			_services = null;
			_servicesMap = null;
		}
		
		
		/**
		 * Updates all of the Services managed by this.
		 */
		public function update():void
		{
			for each(var service:Service in _services)
			{
				service.__update();
			}
		}
		
		
		/**
		 * Gets a Service with the specified name.
		 * @param name The name of the Service to search for.
		 */
		public function getService(name:String):Service
		{
			return _servicesMap.hasOwnProperty(name) ? _servicesMap[name] : null;
		}
		
	}
	
}