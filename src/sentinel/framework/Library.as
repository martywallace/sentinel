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
			_textures[name] = texture;
		}
		
		
		public function addTextureFromBitmap(name:String, bitmap:Bitmap):void
		{
			_textures[name] = Texture.fromBitmap(bitmap);
		}
		
		
		public function getTexture(name:String):Texture
		{
			return _textures[name];
		}
		
	}
	
}