package sentinel.framework.graphics
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import sentinel.framework.ILibraryAsset;
	import sentinel.framework.Library;
	import starling.textures.Texture;
	
	
	/**
	 * A Sentinel level Texture, implementing ILibraryAsset for library storage.
	 * @author Marty Wallace.
	 */
	public class Texture extends starling.textures.Texture implements ILibraryAsset
	{
		
		public static function fromBitmapData(data:BitmapData, generateMipMaps:Boolean = true, optimizeForRenderToTexture:Boolean = false, scale:Number = 1, format:String = 'bgra', repeat:Boolean = false):sentinel.framework.graphics.Texture
		{
			return new sentinel.framework.graphics.Texture(
				starling.textures.Texture.fromBitmapData(data, generateMipMaps, optimizeForRenderToTexture, scale, format, repeat)
			);
		}
		
		
		public static function fromBitmap(bitmap:Bitmap, generalMipMaps:Boolean = true, optimizeForRenderToTexture:Boolean = false, scale:Number = 1, format:String = 'bgra', repeat:Boolean = false):sentinel.framework.graphics.Texture
		{
			return new sentinel.framework.graphics.Texture(
				starling.textures.Texture.fromBitmap(bitmap, generalMipMaps, optimizeForRenderToTexture, scale, format, repeat)
			);
		}
		
		
		public static function fromColor(width:Number, height:Number, color:uint, optimizeForRenderToTexture:Boolean = false, scale:Number = 1, format:String = 'bgra'):sentinel.framework.graphics.Texture
		{
			return new sentinel.framework.graphics.Texture(
				starling.textures.Texture.fromColor(width, height, color, optimizeForRenderToTexture, scale, format)
			);
		}
		
		
		private var _base:starling.textures.Texture;
		
		
		public function Texture(base:starling.textures.Texture)
		{
			_base = base;
		}
		
		
		/**
		 * @private
		 */
		internal function get __base():starling.textures.Texture { return _base; }
		
		
		public function get assetType():String { return Library.TEXTURE; }
		
	}
	
}