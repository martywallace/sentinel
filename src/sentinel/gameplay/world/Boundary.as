package sentinel.gameplay.world
{
	
	import sentinel.framework.util.ObjectUtil;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.physics.Polygon;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * An invisible boundary within a world, usually used with a collection of smaller display-only
	 * Beings e.g. a group of plants, a patch of water, etc.
	 * @author Marty Wallace.
	 */
	public class Boundary extends Being
	{
		
		private var _verticies:Vector.<Vector2D>;
		private var _friction:Number;
		private var _restitution:Number;
		
		
		public function Boundary(verticies:Vector.<Vector2D> = null, friction:Number = 0.2, restitution:Number = 0)
		{
			super();
			
			_set(verticies, friction, restitution);
		}
		
		
		public override function save():Object
		{
			var verticies:Array = [];
			
			for each(var vec:Vector2D in _verticies)
			{
				verticies.push(vec.save());
			}
			
			return ObjectUtil.merge(super.save(), {
				friction: _friction,
				restitution: _restitution,
				verticies: verticies
			});
		}
		
		
		public override function load(data:Object):void
		{
			super.load(data);
			
			var verticies:Vector.<Vector2D> = new <Vector2D>[];
			
			for each(var i:Object in ObjectUtil.prop(data, 'verticies', []))
			{
				verticies.push(new Vector2D(i.x, i.y));
			}
			
			_set(verticies, ObjectUtil.prop(data, 'friction', 0.2), ObjectUtil.prop(data, 'restitution', 0));
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			if (_verticies !== null && _verticies.length !== 0)
			{
				var poly:Polygon = new Polygon(_verticies);
				var body:Body = engine.createBody(Body.STATIC, this);
				
				body.createFixture(poly, new FixtureDef(1, _friction, _restitution));
				
				return body;
			}
			
			return null;
		}
		
		
		private function _set(verticies:Vector.<Vector2D>, friction:Number, restitution:Number):void
		{
			_verticies = verticies;
			_friction = friction;
			_restitution = restitution;
		}
		
	}
	
}