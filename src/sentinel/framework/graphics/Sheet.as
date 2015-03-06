package sentinel.framework.graphics
{
	
	import sentinel.framework.ILibraryAsset;
	import sentinel.framework.Library;
	import starling.textures.TextureAtlas;
	import starling.textures.Texture;
	
	
	public class Sheet implements ILibraryAsset
	{
		
		private var _base:TextureAtlas;
		
		
		public function Sheet(texture:sentinel.framework.graphics.Texture, regions:Object)
		{
			_base = new TextureAtlas(texture.__base);
			
			for (var regionName:String in regions)
			{
				_base.addRegion(regionName, regions[regionName]);
			}
		}
		
		
		public function getTexture(name:String):sentinel.framework.graphics.Texture
		{
			return new sentinel.framework.graphics.Texture(_base.getTexture(name));
		}
		
		
		public function getTextures(prefix:String = ''):Vector.<sentinel.framework.graphics.Texture>
		{
			var result:Vector.<sentinel.framework.graphics.Texture> = new <sentinel.framework.graphics.Texture>[];
			
			for each(var t:starling.textures.Texture in _base.getTextures(prefix))
			{
				result.push(new sentinel.framework.graphics.Texture(t));
			}
			
			return result;
		}
		
		
		internal function get __base():TextureAtlas { return _base; }
		
		
		public function get type():String { return Library.SHEET; }
		
	}
	
}