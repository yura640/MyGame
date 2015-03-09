package view.components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.SimpleButton;
	import flash.events.EventDispatcher;
	
	import mx.core.ButtonAsset;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class TargetVievLogic extends EventDispatcher
	{
		private var target1:SimpleButton; 
		private var target2:SimpleButton;
		private var target3:SimpleButton;
		private var currentTarget:DisplayObject;
		// створюємо вари
		
		public function TargetVievLogic()
		{
			super();
			target1 = WareHouse.getInstance().getAsset("vrag_1") as SimpleButton;
			target2 = WareHouse.getInstance().getAsset("vrag_2") as SimpleButton;
			target3 = WareHouse.getInstance().getAsset("vrag_3") as SimpleButton;
			//достаэмо лінки з варехауса
		}
		
		public function changeEnemie(targetID:int):void{
			
			if(targetID ==1){
				currentTarget=target1
			}else if (targetID ==2){
				currentTarget=target2
			}else if (targetID ==3){
				currentTarget=target3
			}
		dispatchEvent( new EventTrans("sdfsdf", currentTarget));
				
			// іф таргетИД==1 то каренттаргет=таргет1 ....
		
		}
}
}