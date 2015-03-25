package controller.comands
{
	import config.GeneralNotification;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.BonusMediator;
	
	public class addRedButtonMediatorCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.registerMediator( new BonusMediator());
			sendNotification(GeneralNotification.ADD_RED_BTN);
		}
	}
}