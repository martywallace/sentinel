package states
{
	
	import sentinel.framework.graphics.AnimatedSprite;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.State;
	import sentinel.framework.util.Random;
	
	
	public class AnimationTestState extends State
	{
		
		private var _graphics:Vector.<IGraphics>;
		
		
		public function AnimationTestState()
		{
			_graphics = new <IGraphics>[];
			
			for (var i:int = 0; i < 1200; i++)
			{
				var sprite:AnimatedSprite = new AnimatedSprite(library.getSheet('sprite').getTextures('box_'), 10);
				sprite.addTo(graphics);
				
				sprite.alignPivot();
				sprite.x = Random.between(0, viewport.width);
				sprite.y = Random.between(0, viewport.height);
				sprite.rotation = Random.getAngle();
				sprite.depth = sprite.y;
				sprite.currentFrame = Random.between(0, sprite.numFrames);
				sprite.pause();
				
				_graphics.push(sprite);
			}
			
			graphics.sortChildrenByDepth();
		}
		
		
		protected override function update():void
		{
			for each(var graphics:IGraphics in _graphics)
			{
				graphics.rotation += 0.02;
				graphics.scaleX = Math.cos(graphics.rotation);
				graphics.scaleY = Math.sin(graphics.rotation);
			}
		}
		
		
		protected override function get backgroundColor():uint { return 0x333333; }
		
	}
	
}