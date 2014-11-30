package sentinel.gameplay.scene
{
	
	import sentinel.framework.util.ObjectUtil;
	import sentinel.gameplay.events.ContactEvent;
	import sentinel.gameplay.events.RegionEvent;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.gameplay.physics.Polygon;
	import sentinel.gameplay.physics.Vector2D;
	
	
	public class Region extends Being
	{
		
		private var _verticies:Vector.<Vector2D>;
		
		
		public function Region(verticies:Vector.<Vector2D> = null)
		{
			super();
			
			_verticies = verticies;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			if (_verticies !== null && _verticies.length !== 0)
			{
				var body:Body = engine.createBody(Body.STATIC, this);
				var fixture:Fixture = body.createFixture(new Polygon(_verticies));
				
				fixture.isSensor = true;
				
				body.addEventListener(ContactEvent.BEGIN, _handleContact);
				body.addEventListener(ContactEvent.END, _handleContact);
				
				return body;
			}
			
			return null;
		}
		
		
		public override function save():Object
		{
			var verticies:Array = [];
			
			for each(var vec:Vector2D in _verticies)
			{
				verticies.push(vec.save());
			}
			
			return ObjectUtil.merge(super.save(), {
				verticies: verticies
			});
		}
		
		
		public override function load(data:Object):void
		{
			super.load(data);
			
			_verticies = new <Vector2D>[];
			for each(var i:Object in ObjectUtil.prop(data, 'verticies', []))
			{
				_verticies.push(new Vector2D(i.x, i.y));
			}
		}
		
		
		private function _handleContact(event:ContactEvent):void
		{
			dispatchEvent(new RegionEvent(event.type === ContactEvent.BEGIN ? RegionEvent.ENTER : RegionEvent.EXIT, event.externalOwner as Being));
		}
		
	}
	
}