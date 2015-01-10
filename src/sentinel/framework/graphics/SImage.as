package sentinel.framework.graphics
{
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	
	internal class SImage extends Image
	{
		
		private var _owner:Graphics;
		
		
		public function SImage(owner:Graphics, texture:Texture)
		{
			_owner = owner;
			super(texture);
		}
		
		
		internal function get __owner():Graphics { return _owner; }
		
	}
	
}