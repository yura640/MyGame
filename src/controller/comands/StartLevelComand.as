package controller.comands
{
	import model.proxy.GameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.LobbyMediator;
	import view.mediator.ScoreMediator;
	import view.mediator.StartMediator;
	
	public class StartLevelComand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.registerMediator( new StartMediator());
			facade.registerMediator( new ScoreMediator());
			facade.removeMediator(LobbyMediator.NAME);
			//change to command
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).startGame();
			//------------------
		}
	}
}

