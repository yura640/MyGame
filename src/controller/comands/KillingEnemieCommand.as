package controller.comands
{
	import config.GeneralNotification;
	
	import flash.net.sendToURL;
	
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class KillingEnemieCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).timerReset();
			(facade.retrieveProxy(UserProxy.NAME) as UserProxy).addScore();	
			sendNotification(GeneralNotification.REMOVE_ENEMIE);
			//sendNotification(GeneralNotification.CHANGE_SCORE);
		}
	}
}