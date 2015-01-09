package scene
{
	
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.BaseWorld;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.Query;
	import sentinel.gameplay.world.WorldQueryResult;
	
	
	public class PhysicsWorld extends BaseWorld
	{	
		
		public function PhysicsWorld()
		{
			super(
				new EngineDef(new Vector2D(0, 1400)),
				new Debug(game, 1, 0.5, 0, new <int>[Debug.SHAPE, Debug.CENTER_OF_MASS])
			);
		}
		
		
		protected override function registerBeingTypes():Vector.<Class>
		{
			return super.registerBeingTypes().concat(new <Class>[
				Block, Platform
			]);
		}
		
		
		public function get platform():Platform { return getUnique('platform') as Platform; }
		
		
		public function get blocks():Vector.<Being>
		{
			var result:Vector.<Being> = new <Being>[];
			var query:Vector.<WorldQueryResult> = query(Query.type(Block));
			
			for each(var r:WorldQueryResult in query)
			{
				result.push(r.being);
			}
			
			
			return result;
		}
		
	}
	
}