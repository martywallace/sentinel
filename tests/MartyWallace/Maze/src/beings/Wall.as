package beings 
{
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.framework.util.ObjectUtil;
	import sentinel.gameplay.scene.Being;
	
	public class Wall extends Being
	{
		
		private var _width:int;
		private var _height:int;
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Quad = new Quad(_width, _height, 0x5555FF);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.STATIC, this);
			body.createFixture(new Box(_width, _height));
			
			return body;
		}
		
		
		public override function save():Object
		{
			return ObjectUtil.merge(super.save(), {
				width: _width,
				height: _height
			});
		}
		
		
		public override function load(data:Object):void
		{
			super.load(data);
			
			_width = ObjectUtil.prop(data, 'width', 40);
			_height = ObjectUtil.prop(data, 'height', 40);
		}
		
	}

}