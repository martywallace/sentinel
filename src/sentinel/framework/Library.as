package sentinel.framework
{
	
	import flash.media.Sound;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.sound.Sound;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	
	/**
	 * The Library manages game assets e.g. textures, sprite sheets and sound.
	 * @author Marty Wallace.
	 */
	public class Library extends Component
	{
		
		private static const TEXTURES:String = 'textures';
		private static const ATLASES:String = 'atlases';
		private static const SOUNDS:String = 'sounds';
		
		
		private var _content:Object = { };
		
		
		private function _add(category:String, name:String, resource:*):void
		{
			if (!_has(category, name))
			{
				if (!_content.hasOwnProperty(category)) _content[category] = { };
				_content[category][name] = resource;
			}
			else
			{
				throw new Error('Library resource "' + name + '" under category "' + category + '" already exists.');
			}
		}
		
		
		private function _has(category:String, name:String):Boolean
		{
			return _content.hasOwnProperty(category) && _content[category].hasOwnProperty(name);
		}
		
		
		private function _find(category:String, name:String):*
		{
			if (_has(category, name))
			{
				return _content[category][name];
			}
			else
			{
				throw new Error('Library resource "' + name + '" under category "' + category + '" does not exist.');
			}
		}
		
		
		public function addTexture(name:String, texture:Texture):void
		{
			_add(TEXTURES, name, texture);
		}
		
		
		public function addAtlas(name:String, atlas:TextureAtlas):void
		{
			_add(ATLASES, name, atlas);
		}
		
		
		public function addSound(name:String, sound:flash.media.Sound):void
		{
			_add(SOUNDS, name, sound);
		}
		
		
		public function getTexture(name:String):Texture
		{
			return _find(TEXTURES, name) as Texture;
		}
		
		
		public function getTextureFromAtlas(atlasName:String, region:String):Texture
		{
			return getAtlas(atlasName).getTexture(region);
		}
		
		
		public function getTexturesFromAtlas(atlasName:String, prefix:String = ''):Vector.<Texture>
		{
			return getAtlas(atlasName).getTextures(prefix);
		}
		
		
		public function getAtlas(name:String):TextureAtlas
		{
			return _find(ATLASES, name) as TextureAtlas;
		}
		
		
		public function getImage(textureName:String):Image
		{
			return new Image(getTexture(textureName));
		}
		
		
		public function getImageFromAtlas(atlasName:String, region:String):Image
		{
			return new Image(getTextureFromAtlas(atlasName, region));
		}
		
		
		public function getSound(name:String):sentinel.framework.sound.Sound
		{
			return new sentinel.framework.sound.Sound(_find(SOUNDS, name) as flash.media.Sound);
		}
		
		
		public override function get name():String { return 'library'; }
		
	}
	
}