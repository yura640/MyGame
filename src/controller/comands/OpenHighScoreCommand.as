package controller.comands
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.HighScoreMediator;
	
	public class OpenHighScoreCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new HighScoreMediator());
			
		}
	}
}