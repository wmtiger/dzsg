package com.dzsg.modules.login
{
	import com.dzsg.net.NetService;
	import com.wm.comp.WmLabelBtn;
	import com.wm.comp.WmText;
	import com.wm.comp.WmTextInput;
	import com.wm.comp.WmWnd;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class LoginWnd extends WmWnd
	{
		private var _nameStr:WmText;
		private var _pwdStr:WmText;
		private var _nameInput:WmTextInput;
		private var _pwdInput:WmTextInput;
		private var _okBtn:WmLabelBtn;
		private var _regBtn:WmLabelBtn;
		
		public function LoginWnd(title:String = "", w:int = 320, h:int = 220)
		{
			super(title, w, h);
		}
		
		override protected function initWnd():void 
		{
			super.initWnd();
			
			_nameStr = new WmText("用户名：", 0, 0, 60);
			addElementToContent(_nameStr, 40, 30);
			_pwdStr = new WmText("密码：", 0, 0, 60);
			addElementToContent(_pwdStr, 40, 70);
			_nameInput = new WmTextInput();
			addElementToContent(_nameInput, 110, 28);
			_pwdInput = new WmTextInput();
			addElementToContent(_pwdInput, 110, 68);
			
			_okBtn = new WmLabelBtn("确定");
			addElementToContent(_okBtn);
			_okBtn.right = 50;
			_okBtn.bottom = 20;
			_okBtn.clickHandler = function ():void 
			{
				if (_nameInput.text.length > 0 && _pwdInput.text.length > 0) 
				{
					if (_nameInput.text != "在此输入" && _pwdInput.text != "在此输入") 
					{
						NetService.instance.send("Login", "userLogin", onLogin, _nameInput.text, _pwdInput.text);
					}
				}
			}
			
			_regBtn = new WmLabelBtn("注册");
			addElementToContent(_regBtn);
			_regBtn.left = 50;
			_regBtn.bottom = 20;
			_regBtn.clickHandler = function ():void 
			{
				if (_nameInput.text.length > 0 && _pwdInput.text.length > 0) 
				{
					if (_nameInput.text != "在此输入" && _pwdInput.text != "在此输入") 
					{
						NetService.instance.send("Login", "register", onReg, _nameInput.text, _pwdInput.text);
					}
				}
			}
		}
		
		private function onReg(result:Object):void 
		{
			trace("onReg");
			for (var i:String in result) 
			{
				trace(i, result[i]);
			}
		}
		
		private function onLogin(result:Object):void 
		{
			trace("onLogin");
			for (var i:String in result) 
			{
				trace(i, result[i]);
			}
		}
		
		override protected function initCloseBtn():void
		{
		}
		
		override protected function initMaxBtn():void
		{
		}
		
		override protected function initMinBtn():void
		{
		}
		
	}

}