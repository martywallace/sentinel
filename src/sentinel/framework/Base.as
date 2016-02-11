package sentinel.framework {
	import flash.display.Sprite;
	import starling.core.Starling;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import sentinel.framework.graphics.View;
	
	/**
	 * The base class handles initializing Starling and the inbuilt game components.
	 * 
	 * @author Marty Wallace
	 */
	public class Base extends Sprite {
		
		private static var _instance:Base;
		
		/**
		 * A static reference to the Base class.
		 */
		public static function get instance():Base {
			return _instance;
		}

		private var _starling:Starling;

		public function Base() {
			_instance = this;
			
			_starling = new Starling(View, stage);
			
			_starling.showStats = debug;
			_starling.antiAliasing = antiAliasing;
			_starling.addEventListener(Event.ROOT_CREATED, _rootCreated);
		}

		protected function construct():void { }
		protected function update():void { }

		private function _rootCreated(event:Event):void {
			_starling.removeEventListener(Event.ROOT_CREATED, _rootCreated);
			_starling.start();
			
			_starling.root.addEventListener(EnterFrameEvent.ENTER_FRAME, _update);

			construct();
		}
		
		private function _update(event:EnterFrameEvent):void {
			update();
		}
		
		/** The active Starling instance. */
		public function get starling():Starling { return _starling; }
		
		/** The game view instance. */
		public function get view():View { return _starling.root as View; }
		
		/** The level of antialiasing to use with Starling. */
		protected function get antiAliasing():int { return 0; }
		
		/** Whether or not to display debugging information in the top-left of the screen. */
		protected function get debug():Boolean { return false; }

	}
}