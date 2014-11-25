package sentinel.gameplay.scene
{
	
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.physics.IShape;
	
	
	/**
	 * An invisible boundary within a world, usually used with a collection of smaller display-only
	 * Beings e.g. a group of plants, a patch of water, etc.
	 * @author Marty Wallace.
	 */
	public class Boundary extends Being
	{
		
		private var _shape:IShape;
		private var _friction:Number;
		private var _restitution:Number;
		
		
		public function Boundary(shape:IShape, friction:Number = 0.2, restitution:Number = 0)
		{
			super();
			
			_shape = shape;
			_friction = friction;
			_restitution = restitution;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.STATIC, this);
			body.createFixture(_shape, new FixtureDef(1, _friction, _restitution));
			
			return body;
		}
		
	}
	
}