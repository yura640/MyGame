package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import model.dto.EnemieDto;
	
	import mx.core.ButtonAsset;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class TargetVievLogic extends EventDispatcher
	{
		public var currentTarget:DisplayObject;
	
		public function TargetVievLogic(incomingDto:EnemieDto)
		{
			super();
		
			currentTarget = WareHouse.getInstance().getAsset("vrag_"+incomingDto.enemieiID) as SimpleButton;
			
			incomingDto.visualEnemie = currentTarget;
			
			currentTarget.addEventListener(MouseEvent.CLICK, clockOnEnemie);
		
		}
		public function clockOnEnemie (e:MouseEvent):void
		{
			dispatchEvent(new EventTrans (GeneralNotification.PUSH_ON_ENEMIE, currentTarget) );
		
		}
	}
	}

