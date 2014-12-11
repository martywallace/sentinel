package sentinel.gameplay.scene
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.Game;
	import starling.core.Starling;
	
	
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
			if (being !== null)
			{
				_set(being.position.x, being.position.y, rotation, zoom);
			}
			else
			{
				// Ignore this call.
			}
		}
		
		
		public function reset():void
		{
			_set(0, 0, 0, 1);
		}
		
		
		private function _set(x:Number, y:Number, rotation:Number, zoom:Number):void
		{
			_world.graphics.x = viewport.width / 2 + _offsetX;
			_world.graphics.y = viewport.height / 2 + _offsetY;
			_world.graphics.rotation = -rotation;
			_world.graphics.scaleX = _world.graphics.scaleY = zoom;
			
			_world.__content.x = -x;
			_world.__content.y = -y;
			
			if (_world.engine !== null && _world.engine.debugging)
			{
				_world.engine.debug.graphics.x = _world.__content.x;
				_world.engine.debug.graphics.y = _world.__content.y;
				
				_world.engine.debug.wrapper.x = _world.graphics.x;
				_world.engine.debug.wrapper.y = _world.graphics.y;
				_world.engine.debug.wrapper.scaleX = _world.graphics.scaleX;
				_world.engine.debug.wrapper.scaleY = _world.graphics.scaleY;
				_world.engine.debug.wrapper.rotation = _world.graphics.rotation * 180 / Math.PI;
			}
		}
		
		
		public function get viewport():Viewport { return (Starling.current.root as Game).viewport; }
		
		public function get x():Number { return -_world.__content.x; }
		public function set x(value:Number):void{ _set(value, y, rotation, zoom); }
		
		public function get y():Number { return -_world.__content.y; }
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