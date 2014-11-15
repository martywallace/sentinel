package sentinel.gameplay.environment
{
	
	/**
	 * The Camera used to view a World, typically centred on the main character.
	 * @author Marty Wallace.
	 */
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
		
		public function get rotation():Number { return -_world.graphics.rotation; }
		public function set rotation(value:Number):void { _world.graphics.rotation = -value; }
		
		public function get zoom():Number { return 1 + _world.graphics.scaleX; }
		
		public function set zoom(value:Number):void
		{
			_world.graphics.scaleX = 1 + value;
			_world.graphics.scaleY = 1 + value;
		}
		
	}
	
}