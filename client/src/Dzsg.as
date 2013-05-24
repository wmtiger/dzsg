package 
{
	import com.dzsg.modules.login.LoginWnd;
	import com.dzsg.net.NetService;
	import com.wm.assets.TextureAsset;
	import com.wm.mgr.WmCompMgr;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class Dzsg extends Sprite 
	{
		
		public function Dzsg():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			WmCompMgr.instance.init(stage);
			WmCompMgr.instance.addAsset("def", new TextureAsset());
			
			NetService.instance.init("http://localhost/amfphp-2.1.1/Amfphp/", "dzsg");
			
			var win:LoginWnd = new LoginWnd("登录");
			addChild(win);
		}
		
	}
	
}