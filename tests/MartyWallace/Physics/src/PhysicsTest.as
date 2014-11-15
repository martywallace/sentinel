package
{
	
	import sentinel.framework.Game;
	
	
	public class PhysicsTest extends Game
	{
		
		[Embed(source = '../../Assets/Crate.png')]
		public var CrateAsset:Class;
		
		
		public override function construct():void
		{
			library.addTextureFromBitmap('crate', new CrateAsset());
			
			loadState(new Menu());
		}
		
	}
	
}