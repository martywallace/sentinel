package sentinel.framework.graphics
{
	
	import sentinel.framework.client.Viewport;
	import sentinel.framework.IDeconstructs;
	
	
	public interface IGraphics extends IDeconstructs
	{
		
		function removeFromParent(dispose:Boolean = false):void;
		function removeEventListeners(type:String = null):void;
		function alignPivot(hAligh:String = 'center', valign:String = 'center'):void;
		
		
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
		
		function get width():Number;
		function set width(value:Number):void;
		
		function get height():Number;
		function set height(value:Number):void;
		
		function get scaleX():Number;
		function set scaleX(value:Number):void;
		
		function get scaleY():Number;
		function set scaleY(value:Number):void;
		
		function get depth():int;
		function set depth(value:int):void;
		
		function get viewport():Viewport;
		
	}
	
}