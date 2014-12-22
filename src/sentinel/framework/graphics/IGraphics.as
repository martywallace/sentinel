package sentinel.framework.graphics
{
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import sentinel.framework.client.Viewport;
	import sentinel.framework.IDeconstructs;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Stage;
	
	
	public interface IGraphics extends IDeconstructs
	{
		
		function removeFromParent(dispose:Boolean = false):void;
		function removeEventListeners(type:String = null):void;
		
		function globalToLocal(globalPoint:Point, resultPoint:Point = null):Point;
		function localToGlobal(localPoint:Point, resultPoint:Point = null):Point;
		
		function alignPivot(hAligh:String = 'center', valign:String = 'center'):void;
		
		function dispose():void;
		
		
		function get x():Number;
		function set x(value:Number):void;
		function get y():Number;
		function set y(value:Number):void;
		
		function get pivotX():Number;
		function set pivotX(value:Number):void;
		function get pivotY():Number;
		function set pivotY(value:Number):void;
		
		function get skewX():Number;
		function set skewX(value:Number):void;
		function get skewY():Number;
		function set skewY(value:Number):void;
		
		function get rotation():Number;
		function set rotation(value:Number):void;
		
		function get visible():Boolean;
		function set visible(value:Boolean):void;
		
		function get alpha():Number;
		function set alpha(value:Number):void;
		
		function get width():Number;
		function set width(value:Number):void;
		function get height():Number;
		function set height(value:Number):void;
		
		function get scaleX():Number;
		function set scaleX(value:Number):void;
		function get scaleY():Number;
		function set scaleY(value:Number):void;
		
		function get touchable():Boolean;
		function set touchable(value:Boolean):void;
		
		function get blendMode():String;
		function set blendMode(value:String):void;
		
		function get name():String;
		function set name(value:String):void;
		
		function get depth():int;
		function set depth(value:int):void;
		
		function get hasVisibleArea():Boolean;
		function get bounds():Rectangle;
		
		function get parent():DisplayObjectContainer;
		function get base():DisplayObject;
		function get root():DisplayObject;
		function get stage():Stage;
		function get viewport():Viewport;
		
	}
	
}