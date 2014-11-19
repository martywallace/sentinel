package
{
	
	import sentinel.framework.b2.B2Body;
	import sentinel.framework.b2.B2World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.gameplay.scene.Being;
	
	
	public class Bullet extends Being
	{
		
		public function Bullet()
		{
			//
		}
		
		
		public override function deconstruct():void
		{
			super.deconstruct();
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			return null;
		}
		
		
		protected override function defineBody(physics:B2World):B2Body
		{
			return null;
		}
		
		
		protected override function update():void
		{
			super.update();
		}
		
	}
	
}