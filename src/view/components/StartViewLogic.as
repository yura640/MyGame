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
	import flash.utils.Timer;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class StartViewLogic extends ViewLogic //логика графики, как аппендицит медиатора, создает, подгружает графику
													//вешает лисенеры, в этой игре делает большуя часть работы.
													// передает эвент в старт медиатор
	{	
		public var cells:Vector.<MovieClip>;
		public var target:TargetVievLogic;
		public var newTarget:TargetVievLogic;
		public var timer:Timer;
		public var neededCell1:int;
		public var neededSepar1:int;
		
		
		public function StartViewLogic()
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
//			initTimer();
		}
		
//		private function initTimer():void{
//			timer = new Timer(1500);
//			timer.addEventListener(TimerEvent.TIMER, onTimer);
//			timer.start();
//		}
		
//		private function onTimer(event:TimerEvent):void{
//			addTargetToRandomCell();
//		}
		
		public function addTargetToRandomCell(neededCell:int, neededSepar:int):void{
			neededCell1 = neededCell;
			neededSepar1 = neededSepar;
			target = new TargetVievLogic(neededSepar1);
			cells[neededCell1].addChild(target.currentTarget);
		}	 
		
		
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
	}
}
