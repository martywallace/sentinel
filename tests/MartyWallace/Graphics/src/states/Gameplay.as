package states
{
	
	import beings.Box;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.ui.UI;
	import sentinel.testing.states.TestGameplay;
	
	
	public class Gameplay extends TestGameplay
	{
		
		public function Gameplay()
		{
			super(new World(), new UI());
			
			world.camera.x = viewport.center.x;
			world.camera.y = viewport.center.y;
		}
		
		
		protected override function update():void
		{
			var box:Box = new Box();
			
			box.x = Math.random() * viewport.width;
			box.y = Math.random() * viewport.height;
			box.rotation = Math.random() * Math.PI * 2;
			
			world.add(box);
			
			super.update();
		}
		
	}
	
}