package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	
	
	internal class QueryBlock 
	{
		
		internal static const TYPE:String = 'type';
		internal static const POINT:String = 'point';
		internal static const LINE:String = 'line';
		internal static const SHAPE:String = 'shape';
		internal static const LIMIT:String = 'limit';
		
		// TODO: Implement these.
		internal static const ON_SCREEN:String = 'onScreen';
		
		
		private var _type:String;
		private var _options:Data;
		
		
		public function QueryBlock(type:String, options:Object) 
		{
			_type = type;
			_options = Data.create(options);
		}
		
		
		internal function get __type():String { return _type; }
		internal function get __options():Data { return _options; }
		
	}

}