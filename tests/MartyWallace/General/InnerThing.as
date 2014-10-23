package
{
	import sentinel.base.Thing;
	
	public class InnerThing extends Thing
	{
		
		public override function construct():void
		{
			trace(keyboard.getState());
			
			super.construct();
		}
		
		
		protected override function added(to:Thing):void
		{
			//trace("Added to " + to);
		}
		
		
		protected override function removed(from:Thing):void
		{
			//trace("Removed from " + from);
		}
		
	}
	
}