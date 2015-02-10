package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	import sentinel.framework.Thing;
	import sentinel.gameplay.physics.EngineQueryResult;
	import sentinel.gameplay.physics.Shape;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * A Query is used to find a collection of Beings implementing IQueryable who meet a certain
	 * criteria within a world, using the <code>BaseWorld.query()</code> method.
	 * @author Marty Wallace.
	 */
	public class WorldQuery
	{
		
		/**
		 * Alias for <code>new Query()</code>. Aids with single-line chained query construction e.g.
		 * <code>Query.create().line(...).type(...).limit(...)</code>.
		 */
		public static function create():WorldQuery
		{
			return new WorldQuery();
		}
		
		
		private var _blocks:Vector.<QueryBlock>;
		
		
		/**
		 * Constructor.
		 */
		public function WorldQuery()
		{
			_blocks = new <QueryBlock>[];
		}
		
		
		/**
		 * Find Beings who are one of the specified types.
		 * @param types The types to check for.
		 */
		public function type(types:Vector.<Class>):WorldQuery
		{
			_blocks.push(new QueryBlock(QueryBlock.TYPE, { types: types }));
			return this;
		}
		
		
		/**
		 * Find Beings who have a physics body overlapping a given point within the World.
		 * @param point The Vector2D point.
		 */
		public function point(point:Vector2D):WorldQuery
		{
			_blocks.push(new QueryBlock(QueryBlock.POINT, { point: point }));
			return this;
		}
		
		
		/**
		 * Find Beings who have a physics body overlapping a line cast through the world. The result
		 * list will be sorted from nearest to furthest from the start point.
		 * @param start The line start position.
		 * @param end The line end position.
		 */
		public function line(start:Vector2D, end:Vector2D):WorldQuery
		{
			_blocks.push(new QueryBlock(QueryBlock.LINE, { start: start, end: end }));
			return this;
		}
		
		
		/**
		 * Find Beings who have a physics body that overlaps a given shape within the world.
		 * @param shape The shape to use.
		 * @param position The position of the shape.
		 */
		public function shape(shape:Shape, position:Vector2D):WorldQuery
		{
			_blocks.push(new QueryBlock(QueryBlock.SHAPE, { shape: shape, position: position }));
			return this;
		}
		
		
		/**
		 * Reduce the current query pool to the specified limit; usually only used after a line query
		 * to get the nearest results.
		 * @param limit The limit.
		 */
		public function limit(limit:int):WorldQuery
		{
			_blocks.push(new QueryBlock(QueryBlock.LIMIT, { limit: limit }));
			return this;
		}
		
		
		/**
		 * @private
		 */
		internal function __execute(world:BaseWorld):Vector.<WorldQueryResult>
		{
			var wqr:WorldQueryResult;
			var pool:Vector.<WorldQueryResult> = _getQueryablePool(world);
			
			// Sort blocks by type precedence.
			_blocks.sort(function(a:QueryBlock, b:QueryBlock):int
			{
				return a.__type === b.__type ? 0 : (a.__type < b.__type ? -1 : 1);
				
			});
			
			for each(var block:QueryBlock in _blocks)
			{
				var reducedPool:Vector.<WorldQueryResult> = new <WorldQueryResult>[];
				
				if (block.__type === QueryBlock.TYPE)
				{
					// Only allow the specified types.
					for each(wqr in pool)
					{
						for each(var t:Class in block.__options.get('types'))
						{
							if (wqr.being is t)
							{
								reducedPool.push(new WorldQueryResult(this, wqr.being));
								break;
							}
						}
					}
				}
				else if (block.__type === QueryBlock.LIMIT)
				{
					// Reduce the pool to the specified limit.
					reducedPool = pool.slice(0, block.__options.get('limit'));
				}
				else
				{
					// Queries handed over to the physics engine first.
					var eqrs:Vector.<EngineQueryResult> = new <EngineQueryResult>[];
					
					switch(block.__type)
					{
						case QueryBlock.POINT: eqrs = world.engine.queryPoint(block.__options.get('point')); break;
						case QueryBlock.LINE: eqrs = world.engine.queryLine(block.__options.get('start'), block.__options.get('end')); break;
						case QueryBlock.SHAPE: eqrs = world.engine.queryShape(block.__options.get('shape'), block.__options.get('position')); break;
					}
					
					for each(var eqr:EngineQueryResult in eqrs)
					{
						for each(wqr in pool)
						{
							if (eqr.fixture.body.owner === wqr.being)
							{
								reducedPool.push(new WorldQueryResult(this, eqr.fixture.body.owner, eqr));
								break;
							}
						}
					}
				}
				
				pool = reducedPool;
			}
			
			return pool;
		}
		
		
		/**
		 * @private
		 */
		private function _getQueryablePool(world:BaseWorld):Vector.<WorldQueryResult>
		{
			var result:Vector.<WorldQueryResult> = new <WorldQueryResult>[];
			
			for each(var being:Thing in world.__children)
			{
				if (being is IQueryable)
				{
					result.push(new WorldQueryResult(this, being as Being));
				}
			}
			
			return result;
		}
		
	}
	
}