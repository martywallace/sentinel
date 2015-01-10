package sentinel.framework.graphics
{
	
	public class Image extends Graphics
	{
		
		public function Image(texture:Texture)
		{
			super(new StarlingImage(this, texture.__base));
		}
		
	}
	
}