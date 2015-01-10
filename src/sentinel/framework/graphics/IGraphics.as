package sentinel.framework.graphics
{
	
	import flash.geom.Rectangle;
	import sentinel.framework.IDeconstructs;
	import sentinel.gameplay.physics.Vector2D;
	
	
	public interface IGraphics extends IDeconstructs
	{
		
		function localToGlobal(local:Vector2D):Vector2D;
		function globalToLocal(global:Vector2D):Vector2D;
		
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
		
		function get blendMode():String;
		function set blendMode(value:String):void;
		
		function get name():String;
		function set name(value:String):void;
		
		function get depth():int;
		function set depth(value:int):void;
		
		function get hasVisibleArea():Boolean;
		function get atZero():Boolean;
		function get bounds():Rectangle;
		function get viewport():Viewport;
		
		function get parent():GraphicsContainer;
		
	}
	
}