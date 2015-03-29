package model.proxy
{
	import config.GeneralNotification;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class BonusProxy extends Proxy
	{
		public var timer:Timer;
		public var lableTimer:Timer;
		
		public static const NAME:String = "BonusProxy";
		public function BonusProxy()
		{
			super(NAME);
		}
		public function addBonusLable():void{
			timer = new Timer(4000,1);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(event:TimerEvent):void{
			sendNotification(GeneralNotification.ADD_BONUS_LABLE);
		}
		
		public function removeBonusLable():void
		{
			lableTimer = new Timer(3000,1);
			lableTimer.addEventListener(TimerEvent.TIMER, timerOff);
			lableTimer.start();
		}
		
		private function timerOff(e:TimerEvent):void
		{
			sendNotification(GeneralNotification.DELL_BONUS_LABLE);
		}
		
		public function addCurentBonus():void
		{
			sendNotification(GeneralNotification.ADD_CURENT_BONUS);	
		}
		public function resetLableTimer():void
		{
			lableTimer.reset();
		}
		
		public function remCurentBonus():void
		{
			timer = new Timer(4000,1);
			timer.addEventListener(TimerEvent.TIMER, onTimerOff);
			timer.start();
		}
		public function onTimerOff(e:TimerEvent):void
		{
			sendNotification(GeneralNotification.REMOVE_CURENT_BONUS);
		}
		}
	
	}
	
