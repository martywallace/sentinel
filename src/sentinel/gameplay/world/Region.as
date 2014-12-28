package sentinel.gameplay.world
{
	
	import sentinel.framework.Data;
	import sentinel.framework.util.StorageUtil;
	import sentinel.gameplay.events.ContactEvent;
	import sentinel.gameplay.events.RegionEvent;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.gameplay.physics.Polygon;
	import sentinel.gameplay.physics.Vector2D;
	
	
	public class Region extends Being implements IGroupable
	{
		
		private var _name:String;
		private var _verticies:Vector.<Vector2D>;
		
		
		public function Region(name:String, verticies:Vector.<Vector2D> = null)
		{
			super();
			
			_name = name;
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
		
		
		public override function save():Data
		{
			return super.save().merge( {
				name: _name,
				verticies: StorageUtil.saveList(_verticies)
			});
		}
		
		
		public override function load(data:Data):void
		{
			super.load(data);
			
			_name = data.prop('name');
			_verticies = new <Vector2D>[];

			for each(var vertex:Object in data.prop('verticies', []))
			{
				_verticies.push(new Vector2D(vertex.x, vertex.y));
			}
		}
		
		
		private function _handleContact(event:ContactEvent):void
		{
			dispatchEvent(new RegionEvent(event.type === ContactEvent.BEGIN ? RegionEvent.ENTER : RegionEvent.EXIT, event.externalOwner as Being));
		}
		
		
		public function get groupName():String { return '__INTERNAL__regions'; }
		public function get nameInGroup():String { return _name; }
		
	}
	
}