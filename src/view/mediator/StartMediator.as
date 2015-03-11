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
	
	import view.components.StartViewLogic;
	import view.components.ViewLogic;
	
	public class StartMediator extends UIMediator  
	{
		public static const NAME:String = "StartMediator";
		
		
		
		public function StartMediator()
		{
			super(NAME, new StartViewLogic());
			viewComponent.addEventListener(GeneralNotification.SEPAR_DEAD, onSeparDead); //куда его перенести???
			
		}
		
		protected function onSeparDead(event:EventTrans):void
		{
			
			
			sendNotification(GeneralNotification.SEPAR_KILLED, event.data);
			//вьюкомпонет.едд енеміЕнемі Ту Селл(енемі індекс, целлІндекс)
		}
		
		
		override public function listNotificationInterests():Array{
			return ["pushEnemiOnCell"];
		}
		override public function handleNotification(notification:INotification):void{
				
				switch(notification.getName()){
					case "pushEnemiOnCell":
						var neededCell:int = notification.getBody().cell as int;
						var neededSepar:int = notification.getBody().separ as int;
						
					viewComponent.addTargetToRandomCell(neededCell, neededSepar);
				}
		
			}
		}

}
