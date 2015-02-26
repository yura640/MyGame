package view.mediator
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
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
		
		protected function onSeparDead(event:Event):void
		{
			sendNotification(GeneralNotification.SEPAR_KILLED);
			
		}
		//override public function listNotificationInterests():Array{
			//return [GeneralNotification.SAY_HELLO];
		}
		

			

}
