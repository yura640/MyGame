package controller.comands
{
	import config.GeneralNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	import utils.WareHouse;
	
	import view.mediator.ScoreMediator;
	
	import view.mediator.StartMediator;
	
	public class StartLevelComand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
		
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
			var zapros:URLRequest = new URLRequest("Crot.swf");
			loader.load(zapros);
			}
		
			public function onLoad (event:Event):void
			{
				var loaderInfo:LoaderInfo = event.target as LoaderInfo; 
				loaderInfo.removeEventListener(Event.COMPLETE, onLoad)
				WareHouse.getInstance().setData(loaderInfo);
				
				facade.registerMediator( new StartMediator());
				facade.registerMediator( new ScoreMediator());
			}
		}
	}
	
