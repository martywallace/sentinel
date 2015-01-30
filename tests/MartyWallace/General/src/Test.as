package  
{
	
	import sentinel.framework.BaseGame;
	import sentinel.framework.Thing;
	import sentinel.testing.util.Assert;
	
	
	public class Test extends BaseGame
	{
		
		protected override function construct():void
		{
			var a:Element = new Element();
			var b:Element = new Element();
			var c:Element = new Element();
			
			a.add(b);
			a.remove(b);
			b.add(c);
			b.add(a);
			
			Assert.equals(b.owner, a, "A owns B.");
			Assert.equals(c.owner, b, "B owns C.");
		}
		
		
		public override function get identity():String
		{
			return 'Test';
		}
		
	}

}