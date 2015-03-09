package model.proxy
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import utils.WareHouse;
	
	public class GameProxy extends Proxy
	{
		public static const NAME:String = "GameProxy";
		
		public function GameProxy(proxyName:String=null,data:Object=null)
		{
			super(NAME);
		}
		
		public function loadGame():void{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
			var zapros:URLRequest = new URLRequest("res/Crot.swf");
			loader.load(zapros);
		}
		
		public function onLoad (event:Event):void
		{
			var loaderInfo:LoaderInfo = event.target as LoaderInfo; 
			loaderInfo.removeEventListener(Event.COMPLETE, onLoad)
			WareHouse.getInstance().setData(loaderInfo);
		sendNotification("gameIsLoaded");
			
		}
		
		
		public function startGame():void{
			var timer:Timer = new Timer(1500);
			timer.start();
			var neededCell:int = Math.floor(Math.random()*10);
			var neededSepar:int = Math.floor(Math.random()*4);
			sendNotification("pushEnemiOnCell", {cell:neededCell, separ:neededSepar});
			
			 
			 
			
		}
	}
}