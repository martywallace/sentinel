package
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.events.ContactEvent;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.IQueryable;
	import sentinel.gameplay.world.WorldQueryResult;
	import sentinel.gameplay.world.Query;
	
	
	public class Bot extends Being implements IQueryable
	{
		
		private var _team:Team;
		private var _target:Bot;
		private var _cooldown:int = 0;
		private var _health:int = 6;
		
		
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
			var graphics:Quad = new Quad(30, 30, _team.color);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			body.createFixture(new Box(30, 30), new FixtureDef(1));
			
			body.addEventListener(ContactEvent.BEGIN, _onConcat);
			
			return body;
		}
		
		
		private function _onConcat(event:ContactEvent):void
		{
			if (event.externalOwner is Bullet)
			{
				if ((event.externalOwner as Bullet).owner.team !== team)
				{
					_health -= 1;
					
					if (_health <= 0)
					{
						deconstruct();
					}
					
					event.externalOwner.deconstruct();
				}
			}
		}
		
		
		protected override function update():void
		{
			var closest:Bot = null;
			var closestValue:Number = Number.MAX_VALUE;
			
			for each(var result:WorldQueryResult in world.query(Query.type(Bot)))
			{
				var bot:Bot = result.being as Bot;
				
				if (bot.team !== team)
				{
					if (position.distanceTo(bot.position) < closestValue)
					{
						closest = bot;
						closestValue = position.distanceTo(bot.position);
					}
				}
			}
			
			_target = closest;
				
			if (_target !== null)
			{
				_cooldown --;
				
				if (_cooldown <= 0)
				{
					_cooldown = Random.between(20, 100);
					shoot();
				}
				
				rotation = position.angleTo(_target.position);
				
				body.linearVelocityX = Math.cos(rotation) * 20;
				body.linearVelocityY = Math.sin(rotation) * 20;
			}
			else
			{
				body.linearVelocityX = 0;
				body.linearVelocityY = 0;
			}
			
			super.update();
		}
		
		
		protected function shoot():void
		{
			var bullet:Bullet = new Bullet(this);
			bullet.moveTo(x + Math.cos(rotation) * 32, y + Math.sin(rotation) * 32);
			
			world.add(bullet);
		}
		
		
		public function get team():Team { return _team; }
		
	}
	
}