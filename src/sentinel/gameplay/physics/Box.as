package sentinel.gameplay.physics
{
	
	/**
	 * A box shape; this is a helper for a Polygon with four vertices.
	 * @author Marty Wallace.
	 */
	public class Box extends Polygon
	{
		
		public function Box(width:int, height:int)
		{
			super(new <Vector2D>[
				new Vector2D(-width / 2, -height / 2),
				new Vector2D(width / 2, -height / 2),
				new Vector2D(width / 2, height / 2),
				new Vector2D(-width / 2, height / 2)
			]);
		}
		
	}
	
}