package com.dzsg.net
{
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class NetService
	{
		private static var _instance:NetService;
		
		private var _nc:NetConnection;
		private var _root:String;
		
		public function NetService()
		{
			_nc = new NetConnection();
			_nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			_nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_nc.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}
		
		private function onNetStatus(e:NetStatusEvent):void
		{
			trace("onNetStatus");
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			trace("onSecurityError");
		}
		
		private function onIOError(e:IOErrorEvent):void
		{
			trace("onIOError");
		}
		
		static public function get instance():NetService
		{
			if (_instance == null)
			{
				_instance = new NetService();
			}
			return _instance;
		}
		
		public function init(host:String, root:String):void
		{
			_root = root;
			_nc.connect(host);
		}
		
		/**
		 * 发送命令到后台
		 * @param	cls				后台的类
		 * @param	func			对应的函数
		 * @param	resultHandle	成功的回调
		 * @param	...rest			参数，最多支持10个，再多就用arr传输
		 */
		public function send(cls:String, func:String, resultHandle:Function, ...rest):void
		{
			var cmd:String = _root + "/" + cls + "/" + func;
			if (rest.length == 0) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle));
			}
			else if (rest.length == 1) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0]);
			}
			else if (rest.length == 2) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1]);
			}
			else if (rest.length == 3) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2]);
			}
			else if (rest.length == 4) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2], rest[3]);
			}
			else if (rest.length == 5) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2], rest[3], rest[4]);
			}
			else if (rest.length == 6) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2], rest[3], rest[4], rest[5]);
			}
			else if (rest.length == 7) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2], rest[3], rest[4], rest[5], rest[6]);
			}
			else if (rest.length == 8) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2], rest[3], rest[4], rest[5], rest[6], rest[7]);
			}
			else if (rest.length == 9) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2], rest[3], rest[4], rest[5], rest[6], rest[7], rest[8]);
			}
			else if (rest.length == 10) 
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest[0], rest[1], rest[2], rest[3], rest[4], rest[5], rest[6], rest[7], rest[8], rest[9]);
			}
			else
			{
				_nc.call(cmd, new Responder(resultHandle, statusHandle), rest);
			}
		}
		
		private function statusHandle(obj:Object):void
		{
			trace("responder statusHandle");
			for (var i:String in obj) 
			{
				trace(i, obj[i]);
			}
		}
	
	}

}