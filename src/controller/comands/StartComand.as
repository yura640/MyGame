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
	
	import view.mediator.RootMediator;
	import view.mediator.ScoreMediator;
	import view.mediator.StartMediator;
	
	public class StartComand extends SimpleCommand
	{
		
		
		override public function execute(notification:INotification):void{
			
			
			var rootSprite:Sprite = notification.getBody() as Sprite; 
			facade.registerMediator( new RootMediator(rootSprite));
			facade.registerProxy(new UserProxy());
			
			Facade.getInstance().registerCommand(GeneralNotification.START_LEVEL, StartLevelComand);
			Facade.getInstance().sendNotification(GeneralNotification.START_LEVEL);			
			facade.registerCommand(GeneralNotification.SEPAR_KILLED, SeparKilledCommand);	
					
		}
	}
}