package controller.comands
{
	import config.GeneralNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import model.proxy.GameProxy;
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
		
			
				
				
				facade.registerMediator( new StartMediator());
				facade.registerMediator( new ScoreMediator());
				(facade.retrieveProxy(GameProxy.NAME) as GameProxy).startGame();
			}
		}
	}
	
