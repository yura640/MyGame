package view.mediator
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.osmf.events.DisplayObjectEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.patterns.observer.Notification;
	
	import utils.EventTrans;
	
	import view.components.GamePlayViewLogic;
	import view.components.ViewLogic;
	
	public class GamePlayMediator extends UIMediator  
	{
		public static const NAME:String = "StartMediator";
	
		public function GamePlayMediator()
		{
			super(NAME, new GamePlayViewLogic());
			viewComponent.addEventListener(GeneralNotification.ON_CLICK_ON_TARGET, removeEnemie);
		}
		
		public function removeEnemie(e:Event):void{
			sendNotification(GeneralNotification.CLICK_ON_ENEMIE);
				
		}	
		private function get startViewLogic():GamePlayViewLogic{
			return viewComponent as GamePlayViewLogic;
		}		
		
		
		override public function listNotificationInterests():Array{
			return [GeneralNotification.PUSH_ENEMI_ON_CELL, GeneralNotification.REMOVE_ENEMIE];
		}
		
		override public function handleNotification(notification:INotification):void{
			switch(notification.getName()){
				case GeneralNotification.PUSH_ENEMI_ON_CELL:
					var neededCell:int = notification.getBody().cell as int;
					var neededSepar:int = notification.getBody().separ as int;
					startViewLogic.addTargetToRandomCell(neededCell, neededSepar);
					sendNotification(GeneralNotification.TARGET_IS_ADDED);
					break;
				case GeneralNotification.REMOVE_ENEMIE:
					startViewLogic.removeEnemie();
					break;
					}	
		}
				
	}
}
		
		
		
	

