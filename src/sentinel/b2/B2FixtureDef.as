package sentinel.b2
{
	
	public class B2FixtureDef
	{
		
		private var _density:Number;
		private var _friction:Number;
		private var _restitution:Number;
		
		
		public function B2FixtureDef(density:Number = 0, friction:Number = 0.2, restitution:Number = 0)
		{
			_density = density;
			_friction = friction;
			_restitution = restitution;
		}
		
		
		public function get density():Number{ return _density; }
		public function set density(value:Number):void{ _density = value; }
		public function get friction():Number{ return _friction; }
		public function set friction(value:Number):void{ _friction = value; }
		public function get restitution():Number{ return _restitution; }
		public function set restitution(value:Number):void{ _restitution = value; }
		
	}
	
}