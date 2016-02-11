package {
	import sentinel.framework.Base;
	
	public class General extends Base {
		
		protected override function construct():void {
			var bundle:Bundle = new Bundle();
			// ...
		}
		
		protected override function update():void {
			// trace('update');
		}
		
		protected override function get antiAliasing():int { return 1; }
		protected override function get debug():Boolean { return true; }
		
	}
}