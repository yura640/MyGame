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
	
	import view.mediator.RootMediator;
	import view.mediator.ScoreMediator;
	import view.mediator.StartMediator;
	
	public class BootComand extends SimpleCommand
	{
		
		
		override public function execute(notification:INotification):void{
			
			
			var rootSprite:Sprite = notification.getBody() as Sprite;
			
			facade.registerCommand(GeneralNotification.LOAD_GAME, LoadGameComand);
			facade.registerCommand(GeneralNotification.GAME_IS_LOADED, StartLevelComand);
			facade.registerCommand(GeneralNotification.SEPAR_KILLED, SeparKilledCommand);	
			facade.registerCommand (GeneralNotification.GENERATE_ENEMI_AND_CELL, AddedEnemiCommand);
				
			facade.registerMediator( new RootMediator(rootSprite));
			facade.registerProxy(new UserProxy());
			facade.registerProxy(new GameProxy());
			
			sendNotification(GeneralNotification.LOAD_GAME);
		}
	}
}