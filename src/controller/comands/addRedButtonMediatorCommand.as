package controller.comands
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.BonusMediator;
	
	public class addRedButtonMediatorCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.registerMediator( new BonusMediator());
			sendNotification("addRedButton");
		}
	}
}