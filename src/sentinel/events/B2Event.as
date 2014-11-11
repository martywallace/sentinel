package sentinel.events
{
	
	import sentinel.b2.B2Body;
	import sentinel.base.Thing;
	import starling.events.Event;
	
	
	public class B2Event extends Event
	{
		
		public static const COLLISION_START:String = 'CollisionStart';
		public static const COLLISION_END:String = 'CollisionEnd';
		
		
		public function B2Event(type:String)
		{
			super(type);
		}
		
		
		public function get body():B2Body { return target as B2Body; }
		public function get thing():Thing { return body.owner; }
		
	}
	
}