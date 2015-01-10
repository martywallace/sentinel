package sentinel.framework.graphics
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import starling.textures.Texture;
	
	
	public class Texture
	{
		
		public static function fromBitmap(bitmap:Bitmap):Texture
		{
			return new Texture(starling.textures.Texture.fromBitmap(bitmap));
		}
		
		
		public static function fromBitmapData(bitmapData:BitmapData):Texture
		{
			return new Texture(starling.textures.Texture.fromBitmapData(bitmapData));
		}
		
		
		private var _base:starling.textures.Texture;
		
		
		/**
		 * Constructor - internal, use <code>Texture.fromX()</code> methods instead.
		 * @param base A base <code>starling.textures.Texture</code>.
		 */
		public function Texture(base:starling.textures.Texture)
		{
			_base = base;
		}
		
		
		internal function get __base():starling.textures.Texture { return _base; }
		
	}
	
}