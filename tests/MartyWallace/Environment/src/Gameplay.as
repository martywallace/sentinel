package
{
	import sentinel.environment.World;
	import sentinel.framework.b2.B2Debug;
	import sentinel.framework.b2.B2Vector2D;
	import sentinel.framework.b2.B2WorldDef;
	import sentinel.framework.State;
	
	public class Gameplay extends State
	{
		
		private var _world:World;
		
		
		public function Gameplay()
		{
			super();
			
			_world = new World(new B2WorldDef(new B2Vector2D(0, 0), true), new B2Debug(game));
			add(_world);
			
			graphics.addChild(_world.graphics);
			
			_world.add(new Block());
			_world.camera.x = 100;
		}
		
		
		public override function update():void
		{
			_world.camera.rotation += 0.01;
			_world.camera.scale -= 0.01;
			
			if (_world.camera.scale < 0.5)
			{
				if (_world.numChildren > 0)
				{
					_world.getChildAt(0).deconstruct();
				}
			}
			
			super.update();
		}
		
	}
	
}