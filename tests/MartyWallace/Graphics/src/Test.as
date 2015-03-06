package
{
	
	import flash.geom.Rectangle;
	import sentinel.framework.graphics.Sheet;
	import sentinel.framework.graphics.Texture;
	import sentinel.testing.TestGame;
	import states.AnimationTestState;
	
	
	public class Test extends TestGame
	{
		
		[Embed(source = '../assets/sprite.png')]
		private var _sprite:Class;
		
		
		protected override function construct():void
		{
			library.registerAssets({
				sprite: new Sheet(Texture.fromBitmap(new _sprite()), {
					box_1: new Rectangle(0, 0, 40, 40),
					box_2: new Rectangle(40, 0, 40, 40),
					box_3: new Rectangle(80, 0, 40, 40),
					box_4: new Rectangle(120, 0, 40, 40),
					box_5: new Rectangle(0, 40, 40, 40),
					box_6: new Rectangle(40, 40, 40, 40),
					box_7: new Rectangle(80, 40, 40, 40),
					box_8: new Rectangle(120, 40, 40, 40)
				})
			});
			
			loadState(new AnimationTestState());
		}
		
	}
	
}