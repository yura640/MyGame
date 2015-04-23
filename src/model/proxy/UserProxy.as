package model.proxy
{
	import config.GeneralNotification;
	
	import flash.net.SharedObject;
	
	import model.dto.UserDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class UserProxy extends Proxy
	{
		public static const NAME:String = "UserProxy";
		public var mySo:SharedObject;
		
		public function UserProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME, new UserDto());
		}
		
		public function get user():UserDto{  
			return getData() as UserDto;
	}
		
		public function addScore(score:int):void{
			user.score+=score;
			sendNotification(GeneralNotification.CHANGE_SCORE, user.score);
		}
		
		public function addUserName (name1:String):void
		{
			user.name = name1;
			sharedObject();
		}
		public function sharedObject():void
		{
			 mySo = SharedObject.getLocal("mySharedObject1");
			
			 if (mySo.data == null) {
				 mySo.data[user.name] = new Object();
				 mySo.data.name = "mySharedObject1";
				 mySo.data[user.name].name = user.name;
				 mySo.data[user.name].score = user.score;
				// trace (user.name + "1");
			 }
			 if (mySo.data[user.name] == null){
				 mySo.data[user.name] = new Object();
				 mySo.data[user.name].name = user.name;
				 mySo.data[user.name].score = user.score;
				// trace (user.name + "2");
			 } else {
				 mySo.data[user.name].score = user.score;
				 //trace (user.name + "3");
			 }
			 
			var arrOfNamesAndScores:Array = new Array();
			arrOfNamesAndScores.push(mySo.data[user.name].name,  mySo.data[user.name].score);
			arrOfNamesAndScores.sortOn("score", Array.DESCENDING | Array.NUMERIC)
				trace (arrOfNamesAndScores);
				
				sendNotification("myDto", arrOfNamesAndScores);
		}
//		public function sendDto ():void
//		{
//			sendNotification("myDto", UserDto);
		
//		}
	}
	
}