package sentinel.framework.graphics 
{	
	
	public interface IGraphicsContainer extends IGraphics
	{
		
		function sortChildrenByDepth():void;
		
		function addChild(child:IGraphics):IGraphics;
		function addChildAt(child:IGraphics, index:int):IGraphics;
		
		function removeChild(child:IGraphics, dispose:Boolean = false):IGraphics;
		function removeChildAt(index:int, dispose:Boolean = false):IGraphics;
		function removeChildren(startIndex:int = 0, endIndex:int = -1, dispose:Boolean = false):void;
		
		function getChildAt(index:int):IGraphics;
		function getChildByName(name:String):IGraphics;
		function getChildIndex(child:IGraphics):int;
		
		function get numChildren():int;
		function get autoSort():Boolean;
		
	}
	
}