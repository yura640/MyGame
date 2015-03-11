package view.mediator
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import flashx.textLayout.formats.Direction;
	
	import org.osmf.events.DisplayObjectEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.ScoreViewLogic;
	import view.components.StartViewLogic;
	import view.components.ViewLogic;
	
	public class ScoreMediator extends UIMediator
	{
		public static const NAME:String = "ScoreMediator"; 
		
		public function ScoreMediator()
		{
			super(NAME, new ScoreViewLogic());
		}
		override public function listNotificationInterests():Array{
			return [GeneralNotification.CHANGE_SCORE];
		}
		override public function handleNotification(notification:INotification):void{
			
			switch(notification.getName()){
				case GeneralNotification.CHANGE_SCORE:
					viewComponent.upScore(notification.getBody());
					break;
			
					
	}
	}
	}
}