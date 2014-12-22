package sentinel.gameplay.physics
{
	
	import Box2D.Collision.b2AABB;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.Contacts.b2Contact;
	
	
	public class Fixture
	{
		
		private var _base:b2Fixture;
		
		
		/**
		 * Internal - Use <code>B2Body.createFixture()</code>.
		 */
		public function Fixture(fixture:b2Fixture)
		{
			_base = fixture;
			_base.SetUserData(this);
		}
		
		
		public function redefine(fixtureDef:FixtureDef):void
		{
			_base.SetDensity(fixtureDef.density);
			_base.SetFriction(fixtureDef.friction);
			_base.SetRestitution(fixtureDef.restitution);
			
			if(_base.GetBody() !== null)
			{
				_base.GetBody().ResetMassData();
			}
		}
		
		
		public function overlaps(fixture:Fixture):Boolean
		{
			return aabb.TestOverlap(fixture.aabb);
		}
		
		
		internal function get __base():b2Fixture{ return _base; }
		
		public function get body():Body{ return (_base.GetBody().GetUserData() as BodyData).body; }
		public function get aabb():b2AABB{ return _base.GetAABB(); }
		public function get density():Number{ return _base.GetDensity(); }
		public function get friction():Number{ return _base.GetFriction(); }
		public function get restitution():Number{ return _base.GetRestitution(); }
		public function get isSensor():Boolean{ return _base.IsSensor(); }
		public function set isSensor(value:Boolean):void{ _base.SetSensor(value); }
		
	}
	
}