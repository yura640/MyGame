package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.drm.VoucherAccessInfo;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class GamePlayViewLogic extends ViewLogic //логика графики, как аппендицит медиатора, создает, подгружает графику
													//вешает лисенеры, в этой игре делает большуя часть работы.
													// передает эвент в старт медиатор
	{	
		public var cells:Vector.<MovieClip>;
		public var target:TargetVievLogic;
		//public var newTarget:TargetVievLogic;
		public var redBtn:RedBtnViewLigic;
		public var lableVL:RedBtnViewLigic;
		public var timer:Timer;
		public var neededCell1:int;
		public var neededSepar1:int;
		public var curentTarget:DisplayObject;
		
		public function GamePlayViewLogic()
		{
			super(WareHouse.getInstance().getAsset('www_1') as MovieClip);
		
			initAllCellsAndTarget();
		}
		private function initAllCellsAndTarget():void{
			
			cells = new Vector.<MovieClip>;
			var counter:int = 0;
			while (content.hasOwnProperty('circle_'+counter)){
				cells.push(content['circle_'+counter]);
				counter++;
			}

		}
		
		public function addTargetToRandomCell(neededCell:int, neededSepar:int):void{
			neededCell1 = neededCell;
			neededSepar1 = neededSepar;
			target = new TargetVievLogic(neededSepar1);
			
			cells[neededCell1].addChild(target.currentTarget);
			
			target.currentTarget.addEventListener(MouseEvent.CLICK, onClickOnTarget);
		}
			
		public function onClickOnTarget(e:MouseEvent):void
			{
				dispatchEvent(new Event(GeneralNotification.ON_CLICK_ON_TARGET));
			}

		public function removeEnemie():void
		{		
			if (target.currentTarget.parent != null){
				
			cells[neededCell1].removeChild(target.currentTarget);
			dispatchEvent(new Event(GeneralNotification.RESET_SCORE_AND_TIMER));
			
			}
		}
		
		public function removeEnemieByTimer():void
		{		
			if (target.currentTarget.parent != null){
				
				cells[neededCell1].removeChild(target.currentTarget);
			
			}
		}
		
		public function addRedBtn():void
		{
			redBtn = new RedBtnViewLigic();
			content.addChild(redBtn.btn);
			redBtn.btn.x = 300;
			redBtn.btn.y = 280;
			redBtn.btn.addEventListener(MouseEvent.CLICK, onClickOnRedBtn);
		}
		public function onClickOnRedBtn(e:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralNotification.ON_CLICK_ON_RED_BTN));
		}
		
		public function addbonusLable():void
		{
			lableVL = new RedBtnViewLigic();
			content.addChild(lableVL.lableRedBtn);
			lableVL.lableRedBtn.x = 415;
			lableVL.lableRedBtn.y = 60;
			lableVL.lableRedBtn.addEventListener(MouseEvent.CLICK, onClickOnLable);
		}
		
		public function remBonusLable():void
		{
			content.removeChild(lableVL.lableRedBtn);
			lableVL.lableRedBtn.removeEventListener(MouseEvent.CLICK, onClickOnLable);
		}
		
		public function onClickOnLable(e:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralNotification.ON_CLICK_ON_LABLE));
		}
		public function remCurentBonus():void
		{
			content.removeChild(redBtn.btn);
			redBtn.btn.removeEventListener(MouseEvent.CLICK, onClickOnRedBtn);
		}
			
	}
		
}		
//		target.addEventListener("clickOnTarget", delEnemie);
//		
//		public function delEnemie(e:Event):void{
//			target.killEnemie();
//		}
//	
//			newTarget.addEventListener("udalitVraga", onRemove);
//			function onRemove(event:EventTrans):void{
//				var removableEnemi:DisplayObject = event.data as DisplayObject;
//				cells[neededCell1].removeChild(removableEnemi);
//			}
			
		
		
			 
		
		
//		private function onClickOnTarget(event:MouseEvent):void{
//			target.parent.removeChild(target);
//			dispatchEvent(new EventTrans(GeneralNotification.SEPAR_DEAD, target )); 
//		}
//		public function randomRange(minNum:Number, maxNum:Number):Number{
//			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
//		}
//		
//		private function newEnemieTimer():void{
//			timer = new Timer(10000);
//			timer.addEventListener(TimerEvent.TIMER, createNewEnemie);
//			//timer.start();
//		function createNewEnemie (event:TimerEvent):void{
//			var n:int = Math.floor(Math.random()*11);
//			if (n>6){
//				dispatchEvent(new EventTrans("sozdatBoss", target));
//			}
//			else {
//				//dispatchEvent(new EventTrans("sozdatComrad"));
//			}
//		}
//		}
//	
	

