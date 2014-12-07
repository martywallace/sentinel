package scene
{
	
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.Vector2D;
	
	
	public class PhysicsWorld extends World
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
		public function get blocks():Vector.<Being> { return getBeingsByType(Block); }
		
	}
	
}