package sentinel.gameplay.world
{
	
	import sentinel.framework.Thing;
	import sentinel.gameplay.physics.Fixture;
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
		
		
		public static function line(start:Vector2D, end:Vector2D):Query
		{
			return new Query(LINE, { start: start, end: end });
		}
		
		
		public static function shape(shape:Shape, position:Vector2D):Query
		{
			return new Query(SHAPE, { shape: shape, position: position });
		}
		
		
		private var _type:String;
		private var _options:Object;
		
		
		public function Query(type:String, options:Object = null)
		{
			_type = type;
			_options = options;
		}
		
		
		internal function __execute(world:World):Vector.<Being>
		{
			var result:Vector.<Being> = new <Being>[];
			var being:Thing;
			
			if (_type === ALL)
			{
				// Return all Beings in the world.
				for each(being in world.__children)
				{
					if (being is IQueryable)
					{
						result.push(being);
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
						result.push(being);
					}
				}
			}
			
			else
			{
				// Physics related queries.
				var fixtures:Vector.<Fixture> = new <Fixture>[];
				
				switch(_type)
				{
					case POINT: fixtures = world.engine.queryPoint(_options.point); break;
					case LINE: fixtures = world.engine.queryLine(_options.start, _options.end); break;
					case SHAPE: fixtures = world.engine.queryShape(_options.shape, _options.position); break;
				}
				
				for each(var fixture:Fixture in fixtures)
				{
					if (fixture.body.owner !== null && fixture.body.owner is IQueryable)
					{
						result.push(fixture.body.owner as Being);
					}
				}
			}
			
			
			return result;
		}
		
	}
	
}