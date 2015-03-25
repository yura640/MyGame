package model.proxy
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class BonusProxy extends Proxy
	{
		public var timer:Timer;
		
		public static const NAME:String = "BonusProxy";
		public function BonusProxy()
		{
			super(NAME);
		}
		public function addRedButton():void{
			timer = new Timer(5000,1);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(event:TimerEvent):void{
			sendNotification("addRedButton");
		}
		}
	
	}
	
