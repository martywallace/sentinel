package 
{
	
	import flash.display.Bitmap;
	import sentinel.framework.Core;
	
	[SWF(frameRate='60', width='800', height='500')]
	public class Main extends Core 
	{
		
		[Embed(source = '../../Assets/Skull.jpg', mimeType='image/jpeg')]
		public static var SkullAsset:Class;
		
		public function Main()
		{
			trace(new SkullAsset() is Bitmap);
			
			super(PhysicsTest, 2, true);
		}
		
	}
	
}