package model.dto
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.net.sendToURL;
	import flash.utils.Timer;
	
	import utils.EventTrans;

	public class EnemieDto extends EventDispatcher
	{
		
			public var enemieiID:int;
			public var visualEnemie:DisplayObject;
			public var cellID:int;
			private var timer:Timer;
			
	
	public function setupTimer(time:int):void
	{
			timer = new Timer(time,1);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
	}
	public function onTimer(e:TimerEvent):void
	{
		dispatchEvent(new EventTrans("dellCurentEnemie", visualEnemie));
	}
	public function resetTimer():void
	{
		timer.reset();
	}
}
}