package sentinel.framework.client
{
	
	import flash.net.SharedObject;
	import sentinel.framework.Component;
	import sentinel.framework.IStorable;
	import sentinel.framework.util.ObjectUtil;
	
	
	/**
	 * Local storage via SharedObject.
	 * @author Marty Wallace.
	 */
	public class Storage extends Component
	{
		
		private var _slot:uint = 1;
		private var _so:SharedObject;
		
		
		protected override function construct():void
		{
			_so = SharedObject.getLocal(game.identity.replace(/[^\w\/]/, ''));
		}
		
		
		public function save(field:String, data:*):void
		{
			_data[field] = data;
		}
		
		
		public function load(field:String, fallback:* = null):*
		{
			return ObjectUtil.prop(_data, field, fallback);
		}
		
		
		public function empty():void
		{
			_so.data[slotName] = { };
		}
		
		
		private function get _data():Object
		{
			if (!_so.data.hasOwnProperty(slotName)) _so.data[slotName] = { };
			return _so.data[slotName];
		}
		
		
		public function set slot(value:uint):void { _slot = value; }
		public function get slot():uint { return _slot; }
		
		public function get slotName():String { return '_slot' + slot; }
		
		public override function get name():String { return 'storage'; }
		
	}
	
}