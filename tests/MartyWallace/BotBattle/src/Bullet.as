package
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.scene.Being;
	
	
	public class Bullet extends Being
	{
		
		private var _owner:Bot;
		private var _velocity:Vector2D;
		
		
		public function Bullet(owner:Bot)
		{
			super();
			
			_owner = owner;
			_velocity = Vector2D.inDirection(owner.rotation, 500);
		}
		
		
		public override function deconstruct():void
		{
			super.deconstruct();
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Quad = new Quad(5, 5, _owner.team.color);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			var fixture:Fixture = body.createFixture(new Box(5, 5), new FixtureDef(1, 0));
			
			body.isBullet = true;
			body.linearVelocity = _velocity;
			
			fixture.isSensor = true;
			
			return body;
		}
		
		
		protected override function update():void
		{
			if (x < 0 || x > viewport.width || y < 0 || y > viewport.height)
			{
				deconstruct();
			}
			
			super.update();
		}
		
		
		public function get owner():Bot { return _owner; }
		
	}
	
}