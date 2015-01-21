package sentinel.framework
{
	
	/**
	 * Manages the relationship between a collection of Services and an IServiceable.
	 * @author Marty Wallace.
	 */
	public class ServiceManager implements IDeconstructs
	{
		
		private var _serviceable:IServiceable;
		private var _services:Object;
		
		
		/**
		 * Constructor.
		 * @param serviceable The object to be serviced.
		 */
		public function ServiceManager(serviceable:IServiceable, services:Vector.<Service>)
		{
			_serviceable = serviceable;
			_services = { };
			
			for each(var service:Service in services)
			{
				if (service.name !== null)
				{
					if (!_services.hasOwnProperty(service.name))
					{
						_services[service.name] = service;
					}
					else
					{
						throw new Error('Service named "' + service.name + '" already exists.');
					}
				}
				else
				{
					throw new Error("Services must define a name.");
				}
			}
			
			// Initialize Services after they have all been added to the manager.
			for (var serviceName:String in _services)
			{
				(_services[serviceName] as Service).__construct(_serviceable);
			}
		}
		
		
		/**
		 * Deconstruct this ServiceManager and all of the Services it manages.
		 */
		public function deconstruct():void
		{
			for (var serviceName:String in _services)
			{
				(_services[serviceName] as Service).deconstruct();
			}
			
			_services = null;
			_serviceable = null;
		}
		
		
		/**
		 * Updates all of the Services managed by this.
		 */
		public function update():void
		{
			for (var serviceName:String in _services)
			{
				(_services[serviceName] as Service).__update();
			}
		}
		
		
		/**
		 * Gets a Service with the specified name.
		 * @param name The name of the Service to search for.
		 */
		public function getService(name:String):Service
		{
			return _services.hasOwnProperty(name) ? _services[name] : null;
		}
		
	}
	
}