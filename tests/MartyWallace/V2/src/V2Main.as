package {
	
	import sentinel.framework.Game;
	import sentinel.framework.GameSettings;
	
	public class V2Main extends Game {
		
		protected override function construct():void {
			// Set up game here.
			loadState(new GameState());
			
			trace(settings);
		}
		
		protected override function update():void {
			// Update game here.
			// ...
		}
		
		public override function get settings():GameSettings {
			var settings:GameSettings = new GameSettings();
			settings.debug = true;
			
			return settings;
		}
		
	}
	
}