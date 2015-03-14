package view.components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.SimpleButton;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.core.ButtonAsset;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class TargetVievLogic extends EventDispatcher
	{
		public var currentTarget:DisplayObject;
		public var timer:Timer;
		
		public function TargetVievLogic(neededSepar1:int)
		{
			super();
			currentTarget = WareHouse.getInstance().getAsset("vrag_"+neededSepar1) as SimpleButton;
			
			
		}
		
		public function killEnemie():void{
			
			currentTarget.parent.removeChild(currentTarget);
	}

	}
}