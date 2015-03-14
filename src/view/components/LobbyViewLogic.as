package view.components
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import utils.WareHouse;
	
	public class LobbyViewLogic extends ViewLogic
	{
		public var startBtm:SimpleButton;
		
		public function LobbyViewLogic()
		{
			super(WareHouse.getInstance().getAsset('menu_BG') as MovieClip);
			initBtns();
		}
		
		private function get lobbyContent():Sprite{
			return content as Sprite;
		}	
		public function initBtns():void{
			
			startBtm = lobbyContent["startBtm1"];
			startBtm.addEventListener(MouseEvent.CLICK, onClickStartBtn);
		}
		 public function onClickStartBtn(event:MouseEvent):void{
			 dispatchEvent(new Event("btnClicked")); 
			 trace ("dfsdfsdf");
			 
		 }
	}
}