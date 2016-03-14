package {
	
	import sentinel.framework.Game;
	import sentinel.framework.GameSettings;
	
	public class V2Main extends Game {
		
		protected override function construct():void {
			// Set up game here.
			loadState(new GameState());
		}
		
		protected override function update():void {
			// Update game here.
			// ...
		}
		
		public override function get settings():GameSettings {
			var settings:GameSettings = new GameSettings();
			
			settings.debug = true;
			settings.backgroundColor = 0x004477;
			settings.antiAliasing = 4;
			
			return settings;
		}
		
	}
	
}