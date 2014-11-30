package
{
	
	import sentinel.testing.TestGame;
	import starling.textures.Texture;
	import sentinel.framework.Library;
	
	
	public class PhysicsTest extends TestGame
	{
		
		[Embed(source = '../../Assets/Crate.png')]
		public var CrateAsset:Class;
		
		
		public override function construct():void
		{
			super.construct();
			
			library.add(Library.TEXTURE, 'crate', Texture.fromBitmap(new CrateAsset()));
			
			loadState(new Menu());
		}
		
	}
	
}