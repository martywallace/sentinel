package
{
	
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2Box;
	import sentinel.framework.b2.B2FixtureDef;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.gameplay.scene.Being;
	import sentinel.framework.util.Random;
	
	
	public class Bot extends Being
	{
		
		private var _team:Team;
		private var _target:Bot;
		private var _cooldown:int = 0;
		
		
		public function Bot(team:Team)
		{
			_team = team;
			_cooldown = Random.between(15, 100);
		}
		
		
		public override function deconstruct():void
		{
			super.deconstruct();
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Quad = new Quad(40, 40, _team.color);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(physics:B2World):B2Body
		{
			var body:B2Body = physics.createBody(B2Body.DYNAMIC, this);
			body.createFixture(new B2Box(40, 40), new B2FixtureDef(1));
			
			return body;
		}
		
		
		protected override function update():void
		{
			if (_target !== null)
			{
				// Get vector between two things.
				//
			}
			else
			{
				// ...?
			}
			
			super.update();
		}
		
		
		protected function shoot():void
		{
			//
		}
		
		
		public function get team():Team { return _team; }
		
	}
	
}