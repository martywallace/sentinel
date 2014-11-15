package sentinel.environment
{
	
	public class Camera
	{
		
		private var _world:World;
		
		
		public function Camera(world:World)
		{
			_world = world;
		}
		
		
		public function get x():Number { return -_world.graphics.x; }
		
		public function set x(value:Number):void
		{
			_world.graphics.x = -value;
			
			if (_world.physics !== null && _world.physics.debugging)
			{
				_world.physics.debug.graphics.x = _world.graphics.x;
			}
		}
		
		public function get y():Number { return -_world.graphics.y; }
		
		public function set y(value:Number):void
		{
			_world.graphics.y = -value;
			
			if (_world.physics !== null && _world.physics.debugging)
			{
				_world.physics.debug.graphics.y = _world.graphics.y;
			}
		}
		
		public function get rotation():Number { return _world.graphics.rotation; }
		public function set rotation(value:Number):void { _world.graphics.rotation = value; }
		
		public function get scale():Number { return _world.graphics.scaleX; }
		public function set scale(value:Number):void
		{
			_world.graphics.scaleX = value;
			_world.graphics.scaleY = value;
		}
		
	}
	
}