package sentinel.framework
{
	
	import flash.display.Sprite;
	import starling.core.Starling;
	import starling.events.Event;
	import sentinel.framework.errors.FrameworkError;
	
	
	/**
	 * The Sentinel core, extended by your document class.
	 * @author Marty Wallace.
	 */
	public class Core extends Sprite
	{
		
		private var _starling:Starling;
		
		
		/**
		 * Constructor.
		 * @param main Your main game class, extending <code>sentinel.framework.Game</code>.
		 * @param antiAliasing The anti-aliasing level used in rendering Starling graphics. This
		 * value should be between 0 and 16.
		 * @param debug Whether or not to show the Starling debug box.
		 */
		public function Core(main:Class, antiAliasing:int = 0, debug:Boolean = false)
		{
			_starling = new Starling(main, stage);
			
			_starling.showStats = debug;
			_starling.antiAliasing = antiAliasing;
			_starling.addEventListener(Event.ROOT_CREATED, _rootCreated);
		}
		
		
		/**
		 * @private
		 */
		private function _rootCreated(event:Event):void
		{
			if (_starling.root is BaseGame)
			{
				if ((_starling.root as BaseGame).identity !== null)
				{
					_starling.removeEventListener(Event.ROOT_CREATED, _rootCreated);
					_starling.start();
					
					(_starling.root as BaseGame).__construct();
				}
				else
				{
					throw FrameworkError.compile('Your game must define an identity.');
				}
			}
			else
			{
				throw FrameworkError.compile('The class provided to Core() must extend sentinel.framework.BaseGame.');
			}
		}
		
	}
	
}