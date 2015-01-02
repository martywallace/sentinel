package sentinel.gameplay.world
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.client.Viewport;
	import sentinel.gameplay.IPositionProvider;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * The Camera used to view a World, typically centred on the main character. It allows you to
	 * move, rotate and scale the world around a given point.
	 * @author Marty Wallace.
	 */
	public class Camera implements IPositionProvider
	{
		
		private var _world:BaseWorld;
		private var _offsetX:Number = 0;
		private var _offsetY:Number = 0;
		private var _position:Vector2D;
		
		
		public function Camera(world:BaseWorld)
		{
			_world = world;
			_set(0, 0, 0, 1);
		}
		
		
		/**
		 * Move the camera ontop of a Being within the World.
		 * @param being The Being to look at.
		 */
		public function lookAt(being:Being):void
		{
			if (being !== null)
			{
				_set(being.position.x, being.position.y, rotation, zoom);
			}
			else
			{
				// Ignore this call.
				// Being forgiving to those who potentially nullify the game character but let this
				// continue running.
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
		
		
		public function get viewport():Viewport { return BaseGame.getInstance().viewport; }
		
		public function get x():Number { return -_world.__content.x; }
		public function set x(value:Number):void{ _set(value, y, rotation, zoom); }
		
		public function get y():Number { return -_world.__content.y; }
		public function set y(value:Number):void{ _set(x, value, rotation, zoom); }
		
		public function get position():Vector2D
		{
			_position.x = x;
			_position.y = y;
			
			return _position;
		}
		
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