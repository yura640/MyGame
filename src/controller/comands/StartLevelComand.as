package controller.comands
{
	import config.GeneralNotification;
	
	import model.proxy.BonusProxy;
	import model.proxy.GameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GamePlayMediator;
	import view.mediator.LobbyMediator;
	import view.mediator.ScoreMediator;
	
	public class StartLevelComand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.registerMediator( new GamePlayMediator());
			facade.registerMediator( new ScoreMediator());
			facade.removeMediator(LobbyMediator.NAME);
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).startGame();
			(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).addBonusLable();
		
		}
	}
}

