package sentinel.framework
{
	
	import flash.media.Sound;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.Sheet;
	import sentinel.framework.audio.Sound;
	import starling.textures.Texture;
	
	
	/**
	 * The Library manages game assets e.g. textures, sprite sheets and sound.
	 * @author Marty Wallace.
	 */
	public class Library extends Service
	{
		
		private static const TEXTURES:String = 'textures';
		private static const SHEETS:String = 'sheets';
		private static const AUDIO:String = 'audio';
		
		
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
		
		
		public function addSheet(name:String, sheet:Sheet):void
		{
			_add(SHEETS, name, sheet);
		}
		
		
		public function addAudio(name:String, audio:flash.media.Sound):void
		{
			_add(AUDIO, name, audio);
		}
		
		
		public function getTexture(name:String):Texture
		{
			return _find(TEXTURES, name) as Texture;
		}
		
		
		public function getTextureFromAtlas(sheetName:String, regionName:String):Texture
		{
			return getSheet(sheetName).getTexture(regionName);
		}
		
		
		public function getSheet(name:String):Sheet
		{
			return _find(SHEETS, name) as Sheet;
		}
		
		
		public function getImage(textureName:String):Image
		{
			return new Image(getTexture(textureName));
		}
		
		
		public function getImageFromAtlas(sheetName:String, regionName:String):Image
		{
			return new Image(getTextureFromAtlas(sheetName, regionName));
		}
		
		
		public function getAudio(name:String):sentinel.framework.audio.Sound
		{
			return new sentinel.framework.audio.Sound(_find(AUDIO, name) as flash.media.Sound);
		}
		
		
		public override function get name():String { return 'library'; }
		
	}
	
}