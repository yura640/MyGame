package view.mediator
{
	import flash.events.Event;
	
	import view.components.LobbyViewLogic;

	public class LobbyMediator extends UIMediator
	{
		public static const NAME:String = "LobbyMediator";
		
		public function LobbyMediator()
		{
			super(NAME, new LobbyViewLogic());
			viewComponent.addEventListener("btnClicked", btnClicked);
		}
		public function btnClicked(event:Event):void{
			sendNotification("startTheGame");
		}
	}
}