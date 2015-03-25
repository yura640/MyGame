package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sensors.Accelerometer;
	
	import utils.WareHouse;
	
	public class BonusVeiwLogic extends ViewLogic
	{
		public var redBtn:SimpleButton;
		
		public function BonusVeiwLogic()
		{
			super(WareHouse.getInstance().getAsset('redBtn_BG1') as MovieClip);
			
			initRedBtn();
		}
		
		private function get redBtnContent():Sprite{
			return content as Sprite;
		}
		public function initRedBtn():void{
			redBtn = redBtnContent["redBtn"]
			redBtn.addEventListener(MouseEvent.CLICK, onClickOnRedBtn);
		}
		public function onClickOnRedBtn(e:MouseEvent):void{
			dispatchEvent(new Event (GeneralNotification.DELL_ENI_TARGET));
			
		}
		
		public function addredBtnToStage():void{
			redBtn.parent.addChild(redBtn);
			redBtn.x = 290;
			redBtn.y = 280;
		}
		
	}
}