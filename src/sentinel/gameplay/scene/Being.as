package sentinel.gameplay.scene
{
	
	import flash.utils.getDefinitionByName;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.Thing;
	import sentinel.framework.util.ObjectUtil;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.ui.UI;
	import starling.display.DisplayObject;
	
	
	/**
	 * A Being is an objct that lives in a World.
	 * @author Marty Wallace.
	 */
	public class Being extends Thing
	{
		
		/**
		 * Attempts to create a new Being from save data obtained via <code>Being.save()</code>.
		 * @param type The type of object to try and create, as a fully qualified class name.
		 * @param data The save data.
		 */
		public static function createFromSave(type:String, data:Object):Being
		{
			var className:Class = null;
			
			try
			{
				className = getDefinitionByName(type) as Class;
			}
			
			catch (error:ReferenceError)
			{
				throw new Error('Type "' + type + '" could not be loaded. You may need to manually reference this type in your project.');
				return null;
			}
			
			var being:Being = new className() as Being;
			being.load(data);
			
			return being;
		}
		
		
		private var _graphics:IGraphics;
		private var _body:Body;
		private var _position:Vector2D;
		private var _rotation:Number = 0;
		
		
		public function Being()
		{
			_position = new Vector2D();
		}
		
		
		public override function deconstruct():void
		{
			if(_graphics !== null) _graphics.deconstruct();
			if(_body !== null) _body.deconstruct();
			
			super.deconstruct();
		}
		
		
		protected override function update():void
		{
			alignGraphics();
			
			super.update();
		}
		
		
		public function alignGraphics():void
		{
			if (_graphics !== null && _body !== null)
			{
				_graphics.x = _body.position.x;
				_graphics.y = _body.position.y;
				_graphics.rotation = _body.rotation;
			}
			else
			{
				_graphics.x = _position.x;
				_graphics.y = _position.y;
				_graphics.rotation = _rotation;
			}
		}
		
		
		public function alignBody():void
		{
			if (_graphics !== null && _body !== null)
			{
				_body.moveTo(_graphics.x, _graphics.y);
				_body.rotation = _graphics.rotation;
			}
			else
			{
				_body.moveTo(_position.x, _position.y);
				_body.rotation = _rotation;
			}
		}
		
		
		public function moveTo(x:Number, y:Number):void
		{
			_position.x = x;
			_position.y = y;
			
			if (_body !== null)
			{
				_body.moveTo(x, y);
			}
			
			if (_graphics !== null)
			{
				_graphics.x = x;
				_graphics.y = y;
			}
		}
		
		
		public override function save():Object
		{
			return ObjectUtil.merge(super.save(), {
				x: x,
				y: y,
				rotation: rotation
			});
		}
		
		
		protected final override function added(world:Thing):void
		{
			if (world is World)
			{
				_graphics = defineGraphics();
				
				if (_graphics !== null)
				{
					// Add the graphics to the World's graphics container.
					(world as World).__content.addChild(_graphics as DisplayObject);
					(world as World).__content.sortChildrenByDepth();
					
					alignGraphics();
				}
				
				if ((world as World).engine !== null)
				{
					// Attempt to define a body for this Being.
					_body = defineBody((world as World).engine);
					alignBody();
				}
			}
			else
			{
				throw new Error("Instances of Being can only be added to a World.");
			}
		}
		
		
		protected final override function removed(world:Thing):void
		{
			if (world is World)
			{
				if (_graphics !== null) _graphics.deconstruct();
				if (_body !== null) _body.deconstruct();
			}
			else
			{
				throw new Error("Instances of Being can only be removed from a World.");
			}
		}
		
		
		protected function defineGraphics():IGraphics
		{
			return null;
		}
		
		
		protected function defineBody(engine:Engine):Body
		{
			return null;
		}
		
		
		public function get world():World { return parent as World; }
		public function get graphics():IGraphics { return _graphics; }
		public function get body():Body { return _body; }
		
		/**
		 * Returns the position of this Being. Modifying the <code>x</code> or <code>y</code> values
		 * of the result will not affect this Being, use <code>moveTo()</code> or modify the
		 * <code>x</code> and <code>y</code> values of this Being directly instead.
		 */
		public function get position():Vector2D
		{
			if (_graphics !== null)
			{
				_position.x = _graphics.x;
				_position.y = _graphics.y;
			}
			
			if (_body !== null)
			{
				_position.x = _body.position.x;
				_position.y = _body.position.y;
			}
			
			return _position;
		}
		
		/**
		 * Get or set the x position of this Being.
		 * This is an alias for <code>position.x</code> and <code>moveTo(value, y)</code>.
		 */
		public function get x():Number { return position.x; }
		public function set x(value:Number):void { moveTo(value, position.y); }
		
		/**
		 * Get or set the y position of this Being.
		 * This is an alias for <code>position.y</code> and <code>moveTo(x, value)</code>.
		 */
		public function get y():Number { return position.y; }
		public function set y(value:Number):void { moveTo(position.x, value); }
		
		
		public function get rotation():Number
		{
			if (_graphics !== null) _rotation = _graphics.rotation;
			if (_body !== null) _rotation = _body.rotation;
			
			return _rotation;
		}
		
		public function set rotation(value:Number):void
		{
			_rotation = value;
			
			if (_body !== null) _body.rotation = value;
			if (_graphics !== null) _graphics.rotation = value;
		}
		
		protected function get ui():UI { return world !== null ? world.ui : null; }
		protected function get camera():Camera { return world !== null ? world.camera : null; }
		
	}
	
}