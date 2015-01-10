package sentinel.framework.graphics
{
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	
	public class TextureAtlas extends starling.textures.TextureAtlas
	{
		
		public function TextureAtlas(texture:Texture, regions:Object)
		{
			super(texture);
			
			for (var frame:String in regions)
			{
				addRegion(frame, regions[frame]);
			}
		}
		
	}
	
}