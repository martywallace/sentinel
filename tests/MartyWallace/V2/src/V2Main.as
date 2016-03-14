package {
	
	import sentinel.framework.Game;
	
	public class V2Main extends Game {
		
		protected override function construct():void {
			// Set up game here.
			loadState(new GameState());
		}
		
		protected override function update():void {
			// Update game here.
			// ...
		}
		
		public override function get antiAliasing():int { return 0; }
		public override function get debug():Boolean { return true; }
		
	}
	
}