package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	
	
	internal class QueryBlock 
	{
		
		// General strategies.
		internal static const TYPE:int = 100;
		
		// Strategies requiring the physics engine.
		internal static const POINT:int = 200;
		internal static const LINE:int = 201;
		internal static const SHAPE:int = 202;
		
		// Finalization strategies.
		internal static const LIMIT:int = 300;
		
		// TODO: Implement these.
		// internal static const ON_SCREEN
		
		
		private var _type:int;
		private var _options:Data;
		
		
		public function QueryBlock(type:int, options:Object) 
		{
			_type = type;
			_options = Data.create(options);
		}
		
		
		internal function get __type():int { return _type; }
		internal function get __options():Data { return _options; }
		
	}

}