package view.mediator
{
	import config.GeneralNotification;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.GameOverViewLogic;

	public class GameOverMediator extends UIMediator
	{
		public static const NAME:String = "GameOverMediator";
		
		public function GameOverMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(NAME, new GameOverViewLogic());
			gameOverViewLogic.addEventListener("returnCommand", toMakeReloadCommand);
		}
		private function get gameOverViewLogic():GameOverViewLogic{
			return viewComponent as GameOverViewLogic;
		}
		public function toMakeReloadCommand(e:Event):void
		{
			sendNotification("toMakeReloadCommand"); 
		}
		override public function listNotificationInterests():Array{
			return [GeneralNotification.CHANGE_SCORE];
		}
		override public function handleNotification(notification:INotification):void{
			
			switch(notification.getName()){
				case GeneralNotification.CHANGE_SCORE:
					gameOverViewLogic.upScore(notification.getBody() as int);
					break;		
			}
		}
		
	}
}