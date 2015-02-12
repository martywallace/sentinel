package
{
	
	import sentinel.testing.TestGame;
	import sentinel.framework.graphics.Texture;
	import states.Menu;
	import starling.animation.Tween;
	
	
	public class PhysicsTest extends TestGame
	{
		
		[Embed(source = '../../Assets/Crate.png')]
		public var CrateAsset:Class;
		
		[Embed(source = '../../Assets/sfx.mp3')]
		public var SFXAsset:Class;
		
		
		protected override function construct():void
		{
			library.addTexture('crate', Texture.fromBitmap(new CrateAsset()));
			library.addSound('sfx', new SFXAsset());
			
			loadState(new Menu());
		}
		
		
		public override function get identity():String
		{
			return 'PhysicsTest';
		}
		
	}
	
}