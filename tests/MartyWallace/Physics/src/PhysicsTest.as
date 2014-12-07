package
{
	
	import sentinel.testing.TestGame;
	import starling.textures.Texture;
	import sentinel.framework.Library;
	import states.Menu;
	
	
	public class PhysicsTest extends TestGame
	{
		
		[Embed(source = '../../Assets/Crate.png')]
		public var CrateAsset:Class;
		
		[Embed(source = '../../Assets/sfx.mp3')]
		public var SFXAsset:Class;
		
		
		protected override function construct():void
		{
			library.add(Library.TEXTURE, 'crate', Texture.fromBitmap(new CrateAsset()));
			library.add(Library.SOUND, 'sfx', new SFXAsset());
			
			loadState(new Menu());
		}
		
	}
	
}