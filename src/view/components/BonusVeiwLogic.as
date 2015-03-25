package view.components
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
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
		
		
		public function onClickOnRedBtn():void{
			redBtn.addChild(redBtn);
		}
		
	}
}