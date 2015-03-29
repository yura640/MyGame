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
			viewComponent.addEventListener(GeneralNotification.RESET_SCORE_AND_TIMER, resetScoreAndTimer);
			viewComponent.addEventListener(GeneralNotification.ON_CLICK_ON_LABLE, addBonusToStage);
			viewComponent.addEventListener(GeneralNotification.ON_CLICK_ON_RED_BTN, removeTargetByRedBtn);
		}
		public function removeTargetByRedBtn (e:Event):void
		{
			sendNotification(GeneralNotification.REMOVE_TARGET_BY_RED_BTN);
		}
		
		public function addBonusToStage(e:Event):void
		{
			sendNotification(GeneralNotification.ADD_BONUS_TO_STAGE);
			sendNotification(GeneralNotification.DELL_BONUS_RESET_TIMER_COMMAND);
			
		}
		
		public function resetScoreAndTimer(a:Event):void
		{
			sendNotification(GeneralNotification.RESET_SCORE);
			sendNotification(GeneralNotification.RESET_TIMER);
		}
		
		public function removeEnemie(e:Event):void{
			sendNotification(GeneralNotification.CLICK_ON_ENEMIE);
			
				
		}	
		private function get startViewLogic():GamePlayViewLogic{
			return viewComponent as GamePlayViewLogic;
		}		
		
		
		override public function listNotificationInterests():Array{
			return [GeneralNotification.PUSH_ENEMI_ON_CELL, GeneralNotification.REMOVE_ENEMIE,
				GeneralNotification.REMOVE_ENEMIE_BY_TIMER, GeneralNotification.ADD_BONUS_LABLE, GeneralNotification.DELL_BONUS_LABLE,
				GeneralNotification.ADD_CURENT_BONUS, GeneralNotification.REMOVE_CURENT_BONUS];
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
				
				case GeneralNotification.REMOVE_ENEMIE_BY_TIMER:
					startViewLogic.removeEnemieByTimer();
					break;
				
				case GeneralNotification.ADD_BONUS_LABLE:
					startViewLogic.addbonusLable();
					sendNotification(GeneralNotification.DELL_BONUS_LABLE_COMMAND);
					break;
				
				case GeneralNotification.DELL_BONUS_LABLE:
					startViewLogic.remBonusLable();
					break;
				
				case GeneralNotification.ADD_CURENT_BONUS:
					startViewLogic.addRedBtn();
					sendNotification(GeneralNotification.REMOVE_CURENT_BONUS_COMMAND);
					break;
				case GeneralNotification.REMOVE_CURENT_BONUS:
					startViewLogic.remCurentBonus();
					break;
			}
			
			
		}
				
	}
}
		
		
		
	

