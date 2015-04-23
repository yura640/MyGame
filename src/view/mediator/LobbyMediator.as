package view.mediator
{
	import config.GeneralNotification;
	
	import flash.events.Event;
	
	import utils.EventTrans;
	
	import view.components.LobbyViewLogic;

	public class LobbyMediator extends UIMediator
	{
		public static const NAME:String = "LobbyMediator";
		
		public function LobbyMediator()
		{
			super(NAME, new LobbyViewLogic());
			viewComponent.addEventListener(GeneralNotification.START_BTN_CLICKED, btnClicked);
			viewComponent.addEventListener("addName", addName);
			viewComponent.addEventListener("clickOnHighScoreBtn", onClickOnHighScoreBtn);
		}
		public function addName (e:EventTrans):void
		{
			sendNotification("onClickOnHighScoreBtn", e.data);
			sendNotification("addNameCommand", e.data);
		}
		public function btnClicked(event:Event):void{
			sendNotification(GeneralNotification.START_THE_GAME);
		}
		public function onClickOnHighScoreBtn (e:Event):void
		{
			sendNotification("onClickOnHighScoreBtn");
		}
	}
}