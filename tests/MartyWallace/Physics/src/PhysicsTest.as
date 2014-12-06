package
{
	
	import sentinel.testing.TestGame;
	import starling.textures.Texture;
	import sentinel.framework.Library;
	
	
	public class PhysicsTest extends TestGame
	{
		
		[Embed(source = '../../Assets/Crate.png')]
		public var CrateAsset:Class;
		
		
		protected override function construct():void
		{
			library.add(Library.TEXTURE, 'crate', Texture.fromBitmap(new CrateAsset()));
			
			loadState(new Menu());
		}
		
	}
	
}