package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.IDeconstructs;
	
	
	public interface IGraphics extends IDeconstructs
	{
		
		function get x():Number;
		function set x(value:Number):void;
		
		function get y():Number;
		function set y(value:Number):void;
		
		function get pivotX():Number;
		function set pivotX(value:Number):void;
		
		function get pivotY():Number;
		function set pivotY(value:Number):void;
		
		function get rotation():Number;
		function set rotation(value:Number):void;
		
		function get visible():Boolean;
		function set visible(value:Boolean):void;
		
		function get viewport():Viewport;
		
	}
	
}