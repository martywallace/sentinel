package beings
{
	
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.scene.Being;
	import sentinel.gameplay.scene.IUnique;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.util.ObjectUtil;
	
	
	public class Hero extends Being implements IUnique
	{
		
		private var _speed:int = 12;
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Quad = new Quad(40, 40, 0xFF0000);
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			
			body.createFixture(new Box(40, 40), new FixtureDef(1));
			
			return body;
		}
		
		
		protected override function update():void
		{
			var kbd:KeyboardState = keyboard.getState();
			
			if (kbd.isDown(Keyboard.A)) body.linearVelocityX -= _speed;
			if (kbd.isDown(Keyboard.D)) body.linearVelocityX += _speed;
			if (kbd.isDown(Keyboard.W)) body.linearVelocityY -= _speed;
			if (kbd.isDown(Keyboard.S)) body.linearVelocityY += _speed;
			
			storage.save('hero', save());
			
			super.update();
		}
		
		
		public function get token():String { return 'hero'; }
		
	}
	
}