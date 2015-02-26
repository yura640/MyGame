package controller.comands
{
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand; // надо создать mediator и VL для отображения результата игры на спрайте
	
	public class SeparKilledCommand extends SimpleCommand
	{
	override public function execute(notification:INotification):void{
		(facade.retrieveProxy(UserProxy.NAME) as UserProxy).addScore(); // таки макаром мы передаем в UserProxy что нужно addScore
																		
	}								
	}
}