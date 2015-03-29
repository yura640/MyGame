package view.components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.EventDispatcher;
	
	import utils.WareHouse;
	
	public class RedBtnViewLigic extends EventDispatcher
	{
		public var btn:DisplayObject;
		public var lableRedBtn:MovieClip;
		
		public function RedBtnViewLigic()
		{
			super();
			btn = WareHouse.getInstance().getAsset("RedBtn_1") as SimpleButton;
			lableRedBtn = WareHouse.getInstance().getAsset("bonusLable_1") as MovieClip;
		}
	}
}