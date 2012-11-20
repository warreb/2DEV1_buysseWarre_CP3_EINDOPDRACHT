package be.devine.cp3.presentation.xml {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class XMLParser extends EventDispatcher {
		// Properties
		public static const XML_LOADED:String = "xmlLoaded";
		
		private var _data:XML;
		
		// Constructor
		public function XMLParser() {}
		
		// Methods
		public function load( pathToXML:String ):void {
			var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
			xmlLoader.addEventListener( ProgressEvent.PROGRESS, progressHandler );
			xmlLoader.addEventListener( Event.COMPLETE, completeHandler );
			xmlLoader.load( new URLRequest( pathToXML ) );
		}
		
		private function ioErrorHandler( e:IOErrorEvent ):void {
			trace("[XMLParser] Can't find the XML path, please check your path again!");
		}
		
		private function progressHandler( e:ProgressEvent ):void {
			trace("[XMLParser] Loading xml - " + e.bytesLoaded + " / " + e.bytesTotal );
		}
		
		private function completeHandler( e:Event ):void {
			trace("[XMLParser] XML loaded and ready to use!");
			data = XML( e.currentTarget.data );
		}
		
		// Getters & Setters
		
		public function get data():XML {
			return _data;
		}

		public function set data(value:XML):void {
			_data = value;
			
			dispatchEvent( new Event( XML_LOADED ) );
		}

	}
}