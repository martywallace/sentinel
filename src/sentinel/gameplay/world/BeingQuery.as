package sentinel.gameplay.world
{
	
	import sentinel.framework.Thing;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.gameplay.physics.Shape;
	import sentinel.gameplay.physics.Vector2D;
	
	
	public class BeingQuery
	{
		
		public static const TYPE:String = 'type';
		public static const POINT:String = 'point';
		public static const LINE:String = 'line';
		public static const SHAPE:String = 'shape';
		
		
		public static function type(type:Class):BeingQuery
		{
			return new BeingQuery(TYPE, { type: type });
		}
		
		
		public static function point(point:Vector2D):BeingQuery
		{
			return new BeingQuery(POINT, { point: point });
		}
		
		
		public static function line(start:Vector2D, end:Vector2D):BeingQuery
		{
			return new BeingQuery(LINE, { start: start, end: end });
		}
		
		
		public static function shape(shape:Shape):BeingQuery
		{
			return new BeingQuery(SHAPE, { shape: shape });
		}
		
		
		private var _type:String;
		private var _options:Object;
		
		
		public function BeingQuery(type:String, options:Object)
		{
			_type = type;
			_options = options;
		}
		
		
		internal function __execute(world:World):Vector.<Being>
		{
			var _result:Vector.<Being> = new <Being>[];
			
			if (_type === TYPE)
			{
				// Query by type of Being.
				for each(var being:Thing in world.__children)
				{
					if (being is IQueryable && being is _options.type)
					{
						_result.push(being);
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
					case SHAPE: fixtures = world.engine.queryShape(_options.shape); break;
				}
				
				for each(var fixture:Fixture in fixtures)
				{
					if (fixture.body.owner !== null && fixture.body.owner is IQueryable)
					{
						_result.push(fixture.body.owner as Being);
					}
				}
			}
			
			
			return _result;
		}
		
	}
	
}