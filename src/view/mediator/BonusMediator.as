package view.mediator
{
	import config.GeneralNotification;
	
	import controller.comands.AddedEnemiCommand;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.BonusVeiwLogic;

	public class BonusMediator extends UIMediator
	{
		public static const NAME:String = "BonusMediator";
		
		public function BonusMediator()
		{
			super(NAME, new BonusVeiwLogic());
			viewComponent.addEventListener("ydalitTargetOtRedBtn", dellEniTarget);
		}
		public function dellEniTarget(e:Event):void
		{
			sendNotification(GeneralNotification.CLICK_ON_ENEMIE);
		}
		
		override public function listNotificationInterests():Array{
			return ["addRedButton"];
		}
		
		override public function handleNotification(notification:INotification):void{
			switch(notification.getName()){
				case "addRedButton":
					viewComponent.addredBtnToStage();
			}
		}
	}
}