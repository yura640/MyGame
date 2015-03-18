package view.components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.core.ButtonAsset;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class TargetVievLogic extends EventDispatcher
	{
		public var currentTarget:DisplayObject;
	
		
		public function TargetVievLogic(neededSepar1:int)
		{
			super();
			currentTarget = WareHouse.getInstance().getAsset("vrag_"+neededSepar1) as SimpleButton;
			
		}	
	
	}
}