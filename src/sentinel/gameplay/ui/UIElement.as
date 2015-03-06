package sentinel.gameplay.ui
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.Thing;
	import sentinel.gameplay.IPositionProvider;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.BaseWorld;
	
	
	public class UIElement extends Thing implements IPositionProvider
	{
		
		private var _graphics:IGraphics;
		private var _position:Vector2D;
		private var _rotation:Number = 0;
		
		
		public function UIElement()
		{
			super();
			
			_position = new Vector2D();
		}
		
		
		public override function deconstruct():void
		{
			if (_graphics !== null) _graphics.deconstruct();
			
			super.deconstruct();
		}
		
		
		public function moveTo(x:Number, y:Number):void
		{
			_position.x = x;
			_position.y = y;
			
			if (_graphics !== null)
			{
				_graphics.x = x;
				_graphics.y = y;
			}
		}
		
		
		protected final override function addedT(ui:Thing):void
		{
			if (ui is BaseUI)
			{
				_graphics = defineGraphics();
				
				if (_graphics !== null)
				{
					// Add the graphics to the UI graphics container.
					_graphics.addTo((ui as BaseUI).graphics);
				}
				
				added(ui as BaseUI);
			}
			else
			{
				throw new Error("Instances of UIElement can only be added to UIElement.");
			}
		}
		
		
		protected function added(to:BaseUI):void
		{
			//
		}
		
		
		protected final override function removedT(ui:Thing):void
		{
			if (ui is BaseUI)
			{
				if (_graphics !== null) _graphics.deconstruct();
				removed(ui as BaseUI);
			}
			else
			{
				throw new Error("Instances of UIElement can only be removed from UIElement.");
			}
		}
		
		
		protected function removed(from:BaseUI):void
		{
			//
		}
		
		
		protected function defineGraphics():IGraphics
		{
			return null;
		}
		
		
		protected function get ui():BaseUI { return parent as BaseUI; }
		protected function get world():BaseWorld { return ui !== null ? ui.world : null; }
		
		public function get graphics():IGraphics { return _graphics; }
		
		public function get position():Vector2D
		{
			if (_graphics !== null)
			{
				_position.x = _graphics.x;
				_position.y = _graphics.y;
			}
			
			return _position;
		}
		
		public function set position(value:Vector2D):void
		{
			moveTo(value.x, value.y);
		}
		
		public function get x():Number{ return position.x; }
		public function set x(value:Number):void{ moveTo(value, position.y); }
		
		public function get y():Number{ return position.y; }
		public function set y(value:Number):void{ moveTo(position.x, value); }
		
		public function get rotation():Number{ return _graphics !== null ? _graphics.rotation : _rotation; }
		
		public function set rotation(value:Number):void
		{
			_rotation = value;
			if (_graphics !== null) _graphics.rotation = value;
		}
		
	}
	
}