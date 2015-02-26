package
{
	import config.GeneralNotification;
	
	import controller.comands.StartComand;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	import utils.WareHouse;
	
	

	[SWF(widt = '760',heigh = '660', frameRate = '24', backgroundColor = '#FFFFFF')]
	public class pureMVCTest extends Sprite
	{
		public function pureMVCTest()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function onAdded(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			Facade.getInstance().registerCommand(GeneralNotification.START, StartComand);
			Facade.getInstance().sendNotification(GeneralNotification.START, this);
		}
	}	
}