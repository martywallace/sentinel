package  
{
	
	import sentinel.testing.TestGame;
	import sentinel.framework.Library;
	import starling.textures.Texture;
	import states.Gameplay;
	
	
	public class GraphicsTest extends TestGame
	{
		
		[Embed(source = '../../Assets/Crate.png')]
		public var BoxAsset:Class;
		
		
		protected override function construct():void
		{
			library.add(Library.TEXTURE, 'box', Texture.fromBitmap(new BoxAsset()));
			
			loadState(new Gameplay());
		}
		
	}

}