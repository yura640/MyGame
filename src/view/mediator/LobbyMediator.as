package view.mediator
{
	import config.GeneralNotification;
	
	import flash.events.Event;
	
	import view.components.LobbyViewLogic;

	public class LobbyMediator extends UIMediator
	{
		public static const NAME:String = "LobbyMediator";
		
		public function LobbyMediator()
		{
			super(NAME, new LobbyViewLogic());
			viewComponent.addEventListener(GeneralNotification.START_BTN_CLICKED, btnClicked);
		}
		public function btnClicked(event:Event):void{
			sendNotification(GeneralNotification.START_THE_GAME);
			
		}
	}
}