package sentinel.framework
{
	
	import flash.media.Sound;
	import sentinel.framework.graphics.Image;
	import starling.textures.Texture;
	
	
	/**
	 * The Library manages game assets e.g. textures, sprite sheets and sound.
	 * @author Marty Wallace.
	 */
	public class Library extends Component
	{
		
		public static const TEXTURE:String = 'texture';
		public static const ATLAS:String = 'atlas';
		public static const SOUND:String = 'sound';
		
		
		private var _content:Object = { };
		
		
		public function add(category:String, name:String, resource:*):void
		{
			if (!has(category, name))
			{
				if (!_content.hasOwnProperty(category)) _content[category] = { };
				_content[category][name] = resource;
			}
			else
			{
				throw new Error('Library resource "' + name + '" under category "' + category + '" already exists.');
			}
		}
		
		
		public function has(category:String, name:String):Boolean
		{
			return _content.hasOwnProperty(category) && _content[category].hasOwnProperty(name);
		}
		
		
		public function find(category:String, name:String):*
		{
			if (has(category, name))
			{
				return _content[category][name];
			}
			else
			{
				throw new Error('Library resource "' + name + '" under category "' + category + '" does not exist.');
			}
		}
		
		
		public function getTexture(name:String):Texture
		{
			return find(TEXTURE, name) as Texture;
		}
		
		
		public function getImage(textureName:String):Image
		{
			return new Image(getTexture(textureName));
		}
		
		
		public function getSound(name:String):Sound
		{
			return find(SOUND, name) as Sound;
		}
		
		
		public override function get name():String { return 'library'; }
		
	}
	
}