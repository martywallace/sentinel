package sentinel.framework.graphics
{
	
	import starling.textures.TextureAtlas;
	
	
	public class Atlas
	{
		
		private var _base:TextureAtlas;
		
		
		public function Atlas(base:TextureAtlas)
		{
			_base = base;
		}
		
		
		internal function get __base():TextureAtlas { return _base; }
		
	}
	
}