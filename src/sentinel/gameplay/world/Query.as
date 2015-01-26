package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	import sentinel.gameplay.physics.EngineQueryResult;
	import sentinel.gameplay.physics.Shape;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * A Query is used to find a collection of Beings implementing IQueryable who meet a certain
	 * criteria within a world, using the <code>BaseWorld.query()</code> method.
	 * @author Marty Wallace.
	 */
	public class Query
	{
		
		public static const ALL:String = 'all';
		public static const TYPE:String = 'type';
		public static const POINT:String = 'point';
		public static const LINE:String = 'line';
		public static const SHAPE:String = 'shape';
		
		
		/**
		 * Find all Beings.
		 */
		public static function all():Query
		{
			return new Query(ALL);
		}
		
		
		/**
		 * Find Beings who are of a specified type.
		 * @param type The type to check for.
		 */
		public static function type(type:Class):Query
		{
			return new Query(TYPE, { type: type });
		}
		
		
		/**
		 * Find Beings who have a physics body overlapping a given point within the World.
		 * @param point The Vector2D point.
		 */
		public static function point(point:Vector2D):Query
		{
			return new Query(POINT, { point: point });
		}
		
		
		/**
		 * Find Beings who have a physics body overlapping a line cast through the world. The result
		 * list will be sorted from nearest to furthest from the start point.
		 * @param start The line start position.
		 * @param end The line end position.
		 * @param limit An optional limit on the amount of Beings returned.
		 */
		public static function line(start:Vector2D, end:Vector2D, limit:int = 0):Query
		{
			return new Query(LINE, { start: start, end: end, limit: limit });
		}
		
		
		/**
		 * Find Beings who have a physics body that overlaps a given shape within the world.
		 * @param shape The shape to use.
		 * @param position The position of the shape.
		 */
		public static function shape(shape:Shape, position:Vector2D):Query
		{
			return new Query(SHAPE, { shape: shape, position: position });
		}
		
		
		private var _type:String;
		private var _options:Data;
		
		
		/**
		 * Constructor. Use the static <code>Query.&lt;type&gt;()</code> methods instead.
		 * @param type The query type.
		 * @param options The options and their values for the type of query being performed.
		 */
		public function Query(type:String, options:Object = null)
		{
			_type = type;
			_options = Data.create(options);
		}
		
		
		/**
		 * @private
		 */
		internal function __execute(world:BaseWorld):Vector.<WorldQueryResult>
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
					if (being is IQueryable && being is _options.get('type'))
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
					case POINT: engineQueryResults = world.engine.queryPoint(_options.get('point')); break;
					case LINE: engineQueryResults = world.engine.queryLine(_options.get('start'), _options.get('end')); break;
					case SHAPE: engineQueryResults = world.engine.queryShape(_options.get('shape'), _options.get('position')); break;
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
				
				if (_type === LINE && _options.get('limit') > 0)
				{
					// Line query can be limited to first N results.
					result = result.slice(0, _options.get('limit'));
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