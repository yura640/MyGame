package controller.comands
{
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GameOverMediator;
	
	public class GameOverCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new GameOverMediator());
			(facade.retrieveProxy(UserProxy.NAME) as UserProxy).addScore();
			
		}
	}
}