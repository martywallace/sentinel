package sentinel.gameplay.environment
{
	
	/**
	 * The Camera used to view a World, typically centred on the main character.
	 * @author Marty Wallace.
	 */
	public class Camera
	{
		
		private var _world:World;
		private var _offsetX:Number = 0;
		private var _offsetY:Number = 0;
		
		
		public function Camera(world:World)
		{
			_world = world;
			_set(0, 0, 0, 1);
		}
		
		
		public function lookAt(being:Being):void
		{
			_set(being.x, being.y, rotation, zoom);
		}
		
		
		public function reset():void
		{
			_set(0, 0, 0, 1);
		}
		
		
		private function _set(x:Number, y:Number, rotation:Number, zoom:Number):void
		{
			_world.graphics.offsetX = _offsetX;
			_world.graphics.offsetY = _offsetY;
			
			_world.graphics.x = -x;
			_world.graphics.y = -y;
			_world.graphics.rotation = -rotation;
			_world.graphics.scaleX = _world.graphics.scaleY = zoom;
			
			if (_world.physics !== null && _world.physics.debugging)
			{
				_world.physics.debug.graphics.x = _world.graphics.x;
				_world.physics.debug.graphics.y = _world.graphics.y;
				
				_world.physics.debug.wrapper.x = _world.graphics.alignedX;
				_world.physics.debug.wrapper.y = _world.graphics.alignedY;
				_world.physics.debug.wrapper.scaleX = _world.graphics.scaleX;
				_world.physics.debug.wrapper.scaleY = _world.graphics.scaleY;
				_world.physics.debug.wrapper.rotation = _world.graphics.rotation * 180 / Math.PI;
			}
		}
		
		
		public function get x():Number { return -_world.graphics.x; }
		public function set x(value:Number):void{ _set(value, y, rotation, zoom); }
		
		public function get y():Number { return -_world.graphics.y; }
		public function set y(value:Number):void{ _set(x, value, rotation, zoom); }
		
		public function get rotation():Number { return -_world.graphics.rotation; }
		public function set rotation(value:Number):void { _set(x, y, value, zoom); }
		
		public function get zoom():Number { return _world.graphics.scaleX; }
		public function set zoom(value:Number):void{ _set(x, y, rotation, value); }
		
		public function get offsetX():Number { return _offsetX; }
		
		public function set offsetX(value:Number):void
		{
			_offsetX = value;
			_set(x, y, rotation, zoom);
		}
		
		public function get offsetY():Number { return _offsetY; }
		
		public function set offsetY(value:Number):void
		{
			_offsetY = value;
			_set(x, y, rotation, zoom);
		}
		
	}
	
}