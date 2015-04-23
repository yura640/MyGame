package controller.comands
{
	import config.GeneralNotification;
	
	import model.dto.EnemieDto;
	import model.proxy.EnemieProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddedEnemiCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var neededCell:int = Math.floor(Math.random()*10);
			var neededSepar:int = (Math.floor(Math.random()*3)+1);
			var enemieDto:EnemieDto = new EnemieDto();
			
			if (neededSepar==1){
			enemieDto.setupTimer(2000); // red
			}
			if (neededSepar==2){
				enemieDto.setupTimer(2500); // ellow
			}
			if (neededSepar==3){
				enemieDto.setupTimer(1000);  //zel
			} 
			
			enemieDto.visualEnemie = null;
			enemieDto.enemieiID = neededSepar;
			enemieDto.cellID = neededCell;
			
			sendNotification(GeneralNotification.PUSH_ENEMI_ON_CELL, enemieDto);
			(facade.retrieveProxy(EnemieProxy.NAME) as EnemieProxy).addDtoToArray(enemieDto);
			}
		}
	}
