package controller.comands
{
	import config.GeneralNotification;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class RemoveTargetByRedBtnCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			sendNotification(GeneralNotification.REMOVE_ENEMIE);
		}
		
	}
}