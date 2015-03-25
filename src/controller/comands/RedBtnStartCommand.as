package controller.comands
{
	import model.proxy.BonusProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.BonusMediator;
	
	public class RedBtnStartCommand extends SimpleCommand
	{
		public function RedBtnStartCommand()
			override public function execute(notification:INotification):void{
				(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).addRedButton();	
				
			}
	}
}