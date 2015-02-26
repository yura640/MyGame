package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import utils.WareHouse;
	
	public class StartViewLogic extends ViewLogic //логика графики, как аппендицит медиатора, создает, подгружает графику
													//вешает лисенеры, в этой игре делает большуя часть работы.
													// передает эвент в старт медиатор
	{	
		public var cells:Vector.<MovieClip>;
		public var target:DisplayObjectContainer;
		public var timer:Timer;
		
		public function StartViewLogic()
		{
			super(WareHouse.getInstance(). getAsset('www_1') as MovieClip);
		
			initAllCellsAndTarget();
		}
		private function initAllCellsAndTarget():void{
			target = WareHouse.getInstance().getAsset("vrag_1") as DisplayObjectContainer;
			target.addEventListener(MouseEvent.CLICK, onClickOnTarget);
			
			cells = new Vector.<MovieClip>;
			var counter:int = 0;
			while (content.hasOwnProperty('circle_'+counter)){
				cells.push(content['circle_'+counter]);
				counter++;
			}
			initTimer();
		}
		private function initTimer():void{
			timer = new Timer(1500);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		private function onTimer(event:TimerEvent):void{
			addTargetToRandomCell();
		}
		private function addTargetToRandomCell():void{
			var randomCellIndex:int = randomRange(0, cells.length-1);
			cells[randomCellIndex].addChild(target);
		}
		private function onClickOnTarget(event:MouseEvent):void{
			target.parent.removeChild(target);
			dispatchEvent(new Event(GeneralNotification.SEPAR_DEAD)); 
		}
		public function randomRange(minNum:Number, maxNum:Number):Number{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		private function newEnemieTimer():void{
			timer = new Timer(10000);
			timer.addEventListener(TimerEvent.TIMER, createNewEnemie);
			//timer.start();
		function createNewEnemie (event:TimerEvent):void{
			var n:int = Math.floor(Math.random()*11);
			if (n>6){
				dispatchEvent(new Event("sozdatBoss"));
			}
			else {
				dispatchEvent(new Event("sozdatComrad"));
			}
		}
		}
	
	}
}
