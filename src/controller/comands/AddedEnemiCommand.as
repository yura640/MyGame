package controller.comands
{
	import config.GeneralNotification;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddedEnemiCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var neededCell:int = Math.floor(Math.random()*10);
			var neededSepar:int = (Math.floor(Math.random()*3)+1);
			sendNotification(GeneralNotification.PUSH_ENEMI_ON_CELL, {cell:neededCell, separ:neededSepar});
			
		}
	}
}