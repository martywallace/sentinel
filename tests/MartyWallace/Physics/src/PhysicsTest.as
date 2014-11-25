package
{
	
	import sentinel.framework.Game;
	import starling.textures.Texture;
	import sentinel.framework.Library;
	
	
	public class PhysicsTest extends Game
	{
		
		[Embed(source = '../../Assets/Crate.png')]
		public var CrateAsset:Class;
		
		
		public override function construct():void
		{
			storage.prepare("PhysicsTest");
			
			library.add(Library.TEXTURE, 'crate', Texture.fromBitmap(new CrateAsset()));
			
			loadState(new Menu());
		}
		
	}
	
}