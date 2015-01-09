package sentinel.gameplay.world 
{
	
	import sentinel.framework.Data;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Edge;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.Vector2D;
	
	
	/**
	 * A boundary made up of four exterior Edge shapes.
	 * @author Marty Wallace.
	 */
	public class BoundaryBox extends Being
	{
		
		private var _width:Number;
		private var _height:Number;
		
		
		public function BoundaryBox(width:Number, height:Number) 
		{
			_width = width;
			_height = height;
		}
		
		
		public override function save():Data
		{
			return super.save().merge({
				width: _width,
				height: _height
			});
		}
		
		
		public override function load(data:Data):void
		{
			super.load(data);
			
			_width = data.get('width', 0);
			_height = data.get('height', 0);
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.STATIC, this);
			
			var tl:Vector2D = new Vector2D(-_width / 2, -_height / 2);
			var tr:Vector2D = new Vector2D(_width / 2, -_height / 2);
			var bl:Vector2D = new Vector2D(-_width / 2, _height / 2);
			var br:Vector2D = new Vector2D(_width / 2, _height / 2);
			
			body.createFixture(new Edge(tl, tr));
			body.createFixture(new Edge(tr, br));
			body.createFixture(new Edge(br, bl));
			body.createFixture(new Edge(bl, tl));
			
			return body;
		}
		
	}

}