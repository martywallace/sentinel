package beings
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.IUnique;
	
	
	public class Hero extends Being implements IUnique
	{
		
		protected override function defineGraphics():IGraphics
		{
			return null;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			return null;
		}
		
		
		public override function save():Object
		{
			return super.save();
		}
		
		
		public override function load(data:Object):void
		{
			super.load(data);
		}
		
		
		public function get token():String { return 'hero'; }
		
	}
	
}