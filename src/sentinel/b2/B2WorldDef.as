package sentinel.b2
{
	
	public class B2WorldDef
	{
		
		private var _gravity:B2Vector2D;
		private var _sleep:Boolean = false;
		private var _velocityIterations:int = 14;
		private var _positionIterations:int = 14;
		
		
		public function B2WorldDef(gravity:B2Vector2D, sleep:Boolean = false, velocityIterations:int = 14, positionIterations:int = 14)
		{
			_gravity = gravity;
			_sleep = sleep;
			_velocityIterations = velocityIterations;
			_positionIterations = positionIterations;
		}
		
		
		public function get gravity():B2Vector2D{ return _gravity; }
		public function get sleep():Boolean{ return _sleep; }
		public function get velocityIterations():int{ return _velocityIterations; }
		public function get positionIterations():int{ return _positionIterations; }
		
	}
	
}