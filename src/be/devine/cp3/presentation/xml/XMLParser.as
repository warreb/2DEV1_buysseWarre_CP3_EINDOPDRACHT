package be.devine.cp3.presentation.xml {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class XMLParser extends EventDispatcher {
		
		private var _xmlLoader:URLLoader;
		private var _ingeladenData:XML;
		public static const XML_LOADED:String = "xmlIngeladen";
		
		
		public function XMLParser() {}


		public function load(path:String):void {
			// laad de xml in
			
			_xmlLoader = new URLLoader();
			_xmlLoader.addEventListener(Event.COMPLETE, xmlLoadedHandler);
			_xmlLoader.load(new URLRequest(path));
		}
		
		private function xmlLoadedHandler(event:Event):void {
			
			ingeladenData = new XML(event.currentTarget.data);
			
			
		}
		
		public function get ingeladenData():XML
		{
			return _ingeladenData;
		}
		
		public function set ingeladenData(value:XML):void
		{
			_ingeladenData = value;
			dispatchEvent(new Event(XML_LOADED));
		}

		
	}
}

