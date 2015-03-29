package controller.comands
{
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ResetTimerCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).timerReset();
			
		}
	}
}