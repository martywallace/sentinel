package scene
{
	
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.Map;
	import sentinel.framework.events.KeyboardEvent;
	
	
	public class SampleMap extends Map
	{	
		
		protected override function construct():void
		{
			if (storage.load('world') !== null)
			{
				load(storage.load('world'));
			}
			else
			{
				var platform:Platform = new Platform();
				platform.moveTo(viewport.center.x, viewport.height - 60);
				
				world.add(platform);
			}
			
			world.camera.x = viewport.center.x;
			world.camera.y = viewport.center.y;
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _keyboard);
		}
		
		
		public override function deconstruct():void
		{
			super.deconstruct();
			
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _keyboard);
		}
		
		
		private function _keyboard(event:KeyboardEvent):void
		{
			world.add(Being.create('scene::Block', {
				x: Math.random() * viewport.width,
				y: -100
			}));
		}
		
	}
	
}