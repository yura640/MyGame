package view.mediator
{
	import config.GeneralNotification;
	
	import flash.display.Sprite;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.HighScoreVL;

	public class HighScoreMediator extends UIMediator
	{
		public static const NAME:String = "HighScoreMediator"; 
		
		public function HighScoreMediator()
		{
			super(NAME, new HighScoreVL());
		}
		private function get highScoreVL():HighScoreVL {
			return viewComponent as HighScoreVL;
		}
		override public function listNotificationInterests():Array{
			return ["myDto"];
		}
		override public function handleNotification(notification:INotification):void{
			
			switch(notification.getName()){
				case "myDto":
					var arr:Array = notification.getBody() as Array;
					highScoreVL.addResultsOnScoreBord(arr);
					break;
				
				
			}



		}
		
	}
}