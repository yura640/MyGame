package model.proxy
{
	import config.GeneralNotification;
	
	import model.dto.UserDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class UserProxy extends Proxy
	{
		public static const NAME:String = "UserProxy";
		
		public function UserProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME, new UserDto());
		}
		
		public function get user():UserDto{ //при запросе user - возращаются конкретные данные из UserDto 
			return getData() as UserDto;
	}
		
		public function addScore ():void{
			user.score++;
			//trace(user.score);
			sendNotification(GeneralNotification.CHANGE_SCORE, user.score);
		
		}
	}
	
}