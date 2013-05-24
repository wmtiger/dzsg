package com.dzsg.comps 
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class DButton extends EventDispatcher 
	{
		private var _label:String;
		private var _labelTextField:TextField;
		private var _view:Sprite;
		private var _enabled:Boolean;
		
		public function DButton(target:IEventDispatcher=null) 
		{
			super(target);
		}
		
		public function get label():String 
		{
			return _label;
		}
		
		public function set label(value:String):void 
		{
			_label = value;
		}
		
		public function get enabled():Boolean 
		{
			return _enabled;
		}
		
		public function set enabled(value:Boolean):void 
		{
			_enabled = value;
		}
		
		public function update():void
		{
			
		}
		
		public function render():void
		{
			
		}
		
	}

}