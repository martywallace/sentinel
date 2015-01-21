package sentinel.framework.graphics
{
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	
	public class Sheet
	{
		
		private var _base:TextureAtlas;
		
		
		public function Sheet(texture:Texture, regions:Object)
		{
			_base = new TextureAtlas(texture);
			
			for (var regionName:String in regions)
			{
				_base.addRegion(regionName, regions[regionName]);
			}
		}
		
		
		public function getTexture(name:String):Texture
		{
			return _base.getTexture(name);
		}
		
		
		public function getTextures(prefix:String):Vector.<Texture>
		{
			return _base.getTextures(prefix);
		}
		
		
		internal function get __base():TextureAtlas { return _base; }
		
	}
	
}