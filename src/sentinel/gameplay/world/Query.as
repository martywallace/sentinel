package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	import sentinel.gameplay.physics.EngineQueryResult;
	import sentinel.gameplay.physics.Shape;
	import sentinel.gameplay.physics.Vector2D;
	
	
	public class Query
	{
		
		public static const ALL:String = 'all';
		public static const TYPE:String = 'type';
		public static const POINT:String = 'point';
		public static const LINE:String = 'line';
		public static const SHAPE:String = 'shape';
		
		
		public static function all():Query
		{
			return new Query(ALL);
		}
		
		
		public static function type(type:Class):Query
		{
			return new Query(TYPE, { type: type });
		}
		
		
		public static function point(point:Vector2D):Query
		{
			return new Query(POINT, { point: point });
		}
		
		
		public static function line(start:Vector2D, end:Vector2D, limit:int = 0):Query
		{
			return new Query(LINE, { start: start, end: end, limit: limit });
		}
		
		
		public static function shape(shape:Shape, position:Vector2D):Query
		{
			return new Query(SHAPE, { shape: shape, position: position });
		}
		
		
		private var _type:String;
		private var _options:Data;
		
		
		public function Query(type:String, options:Object = null)
		{
			_type = type;
			_options = Data.create(options);
		}
		
		
		internal function __execute(world:World):Vector.<WorldQueryResult>
		{
			var being:Being;
			var result:Vector.<WorldQueryResult> = new <WorldQueryResult>[];
			
			if (_type === ALL)
			{
				// Return all Beings in the world.
				for each(being in world.__children)
				{
					if (being is IQueryable)
					{
						result.push(new WorldQueryResult(this, being));
					}
				}
			}
			
			else if (_type === TYPE)
			{
				// Query by type of Being.
				for each(being in world.__children)
				{
					if (being is IQueryable && being is _options.type)
					{
						result.push(new WorldQueryResult(this, being));
					}
				}
			}
			
			else
			{
				// Physics engine related queries.
				var engineQueryResults:Vector.<EngineQueryResult> = new <EngineQueryResult>[];
				
				switch(_type)
				{
					case POINT: engineQueryResults = world.engine.queryPoint(_options.point); break;
					case LINE: engineQueryResults = world.engine.queryLine(_options.start, _options.end); break;
					case SHAPE: engineQueryResults = world.engine.queryShape(_options.shape, _options.position); break;
				}
				
				for each(var eqr:EngineQueryResult in engineQueryResults)
				{
					if (eqr.fixture.body.owner !== null &&
						eqr.fixture.body.owner is Being &&
						eqr.fixture.body.owner is IQueryable)
					{
						result.push(new WorldQueryResult(this, eqr.fixture.body.owner as Being, eqr));
					}
				}
				
				if (_type === LINE && _options.limit > 0)
				{
					// Line query can be limited to first N results.
					result = result.slice(0, _options.limit);
				}
			}
			
			
			return result;
		}
		
		
		/**
		 * Returns the type of query that was made.
		 */
		public function get type():String { return _type; }
		
		/**
		 * Returns the options associated with the query.
		 */
		public function get options():Data { return _options; }
		
	}
	
}