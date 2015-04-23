package view.components
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import model.dto.UserDto;
	
	import utils.WareHouse;
	
	public class HighScoreVL extends ViewLogic
	{
		public function HighScoreVL()
		{
			super(WareHouse.getInstance().getAsset('scoreBord_1') as MovieClip);
		}
		public function addResultsOnScoreBord(scoreDto:Array):void
		{
			for (var i:int = 0; i<10; i++){
				var obj:Object = scoreDto[i];
				(content["scoreText_"+i] as TextField).text = obj.name,  obj.score;
			}
		}
			 
	}
}