package controller.comands
{
	import config.GeneralNotification;
	
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GameOverMediator;
	import view.mediator.GamePlayMediator;
	import view.mediator.ScoreMediator;
	
	public class ReloadCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(GameOverMediator.NAME);
			facade.removeMediator(GamePlayMediator.NAME);
			facade.removeMediator(ScoreMediator.NAME);
			sendNotification(GeneralNotification.GAME_IS_LOADED);
			(facade.retrieveProxy(UserProxy.NAME) as UserProxy).user.score = 0;
			
		}
	}
}