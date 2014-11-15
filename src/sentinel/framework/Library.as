package sentinel.framework
{
	
	import flash.display.Bitmap;
	import starling.textures.Texture;
	
	
	/**
	 * The Library manages game assets e.g. graphics and sound.
	 * @author Marty Wallace.
	 */
	public class Library
	{
		
		private var _textures:Object = { };
		
		
		public function addTexture(name:String, texture:Texture):void
		{
			if (!hasTexture(name))
			{
				_textures[name] = texture;
			}
			else
			{
				throw new Error('Texture named "' + name + '" already exists within the Library.');
			}
		}
		
		
		public function addTextureFromBitmap(name:String, bitmap:Bitmap):void
		{
			addTexture(name, Texture.fromBitmap(bitmap));
		}
		
		
		public function getTexture(name:String):Texture
		{
			return _textures[name];
		}
		
		
		public function hasTexture(name:String):Boolean
		{
			return _textures.hasOwnProperty(name);
		}
		
	}
	
}