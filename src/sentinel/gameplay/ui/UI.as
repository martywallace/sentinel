package sentinel.gameplay.ui
{
	
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.Thing;
	import sentinel.gameplay.scene.World;
	import sentinel.gameplay.states.GameplayState;
	
	
	public class UI extends Thing
	{
		
		private var _graphics:IGraphicsContainer;
		
		
		public function UI()
		{
			_graphics = new Sprite();
		}
		
		
		/**
		 * If this UI is part of a GameplayState, returns the World associated with that GameplayState.
		 * Else return null.
		 */
		public function get world():World
		{
			if (game.state is GameplayState)
			{
				return (game.state as GameplayState).world;
			}
			
			return null;
		}
		
		
		public function get graphics():IGraphicsContainer { return _graphics; }
		
	}
	
}