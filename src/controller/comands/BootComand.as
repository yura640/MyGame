package controller.comands
{
	import config.GeneralNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import model.proxy.BonusProxy;
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	import utils.WareHouse;
	
	import view.mediator.BonusMediator;
	import view.mediator.GamePlayMediator;
	import view.mediator.RootMediator;
	import view.mediator.ScoreMediator;
	
	public class BootComand extends SimpleCommand
	{
		
		
		override public function execute(notification:INotification):void{
			
			
			var rootSprite:Sprite = notification.getBody() as Sprite;
			
			facade.registerCommand(GeneralNotification.LOAD_GAME, LoadGameComand);
			facade.registerCommand(GeneralNotification.GAME_IS_LOADED, StartLobbyComand);
			facade.registerCommand(GeneralNotification.START_THE_GAME, StartLevelComand);
			facade.registerCommand(GeneralNotification.GENERATE_ENEMI_AND_CELL, AddedEnemiCommand);
			facade.registerCommand(GeneralNotification.TARGET_IS_ADDED, RemoveEnemieCommand); 
			facade.registerCommand(GeneralNotification.CLICK_ON_ENEMIE,KillingEnemieCommand);	
			facade.registerCommand(GeneralNotification.TO_MAKE_RED_BTN, RedBtnStartCommand);
			facade.registerCommand(GeneralNotification.ADD_RED_BTN_MEDIATOR, addRedButtonMediatorCommand);
			facade.registerMediator( new RootMediator(rootSprite));
			facade.registerProxy(new UserProxy());
			facade.registerProxy(new GameProxy());
			facade.registerProxy(new BonusProxy());
			
			sendNotification(GeneralNotification.LOAD_GAME);
		}
	}
}