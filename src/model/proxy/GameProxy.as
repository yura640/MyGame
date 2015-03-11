package model.proxy
{
	import config.GeneralNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import utils.WareHouse;
	
	public class GameProxy extends Proxy
	{
		public var timer:Timer;
		public static const NAME:String = "GameProxy";
		
		public function GameProxy()
		{
			super(NAME);
		}
		
		public function startGame():void{
			
			timer = new Timer(1500);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
			
			private function onTimer(event:TimerEvent):void{
			sendNotification("dobavit vraga");
		}
			var neededCell:int = Math.floor(Math.random()*10);
			var neededSepar:int = Math.floor(Math.random()*2+1);
			sendNotification(GeneralNotification.PUSH_ENEMI_ON_CELL, {cell:neededCell, separ:neededSepar});
		}
	}
