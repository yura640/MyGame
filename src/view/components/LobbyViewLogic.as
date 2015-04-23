package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import flashx.textLayout.accessibility.TextAccImpl;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class LobbyViewLogic extends ViewLogic
	{
		public var startBtm:SimpleButton;
		public var user:TextField;
		public var userName:String;
		public var ok:SimpleButton;
		public var highScoreBtn:SimpleButton;
		
		public function LobbyViewLogic()
		{
			super(WareHouse.getInstance().getAsset('menu_BG') as MovieClip);
			initBtns();
		}
		
		private function get lobbyContent():Sprite{
			return content as Sprite;
		}	
		public function initBtns():void{
			
			user = lobbyContent["userName1"] as TextField;
			highScoreBtn = lobbyContent ["highScBtn"];
			highScoreBtn.addEventListener(MouseEvent.CLICK, onClickHighScoreBtn);
			ok = lobbyContent["okay"];
			ok.addEventListener(MouseEvent.CLICK, onOK);
			startBtm = lobbyContent["startBtm1"];
			startBtm.addEventListener(MouseEvent.CLICK, onClickStartBtn);
		}	
		
		public function onOK(e:MouseEvent):void
		{
			if (user !== null){
			userName = user.text;
			} else trace ("asdasdasd");
			
			dispatchEvent(new EventTrans ("addName", userName));
		}
		 public function onClickStartBtn(event:MouseEvent):void{
			 dispatchEvent(new Event(GeneralNotification.START_BTN_CLICKED)); 
		 }
		 public function onClickHighScoreBtn(e:MouseEvent):void
		 {
			 dispatchEvent(new Event("clickOnHighScoreBtn"));
		 }
	}
}