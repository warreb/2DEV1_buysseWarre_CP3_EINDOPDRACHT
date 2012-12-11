/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 10:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.service {
import be.devine.cp3.presentation.factory.SlideVOFactory;
import be.devine.cp3.presentation.factory.SlideVOFactory;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class SlideService extends EventDispatcher{

    public var slides:Array;

    public function SlideService(){}

    public  function load(){
        var slideLoader:URLLoader = new URLLoader();
        slideLoader.addEventListener(Event.COMPLETE,SlideXMLLoadedHandler);
        slideLoader.load(new URLRequest('assets/xml/slides.xml'));
    }

    private function SlideXMLLoadedHandler(event:Event):void {
            var slidesXML: XML = new XML(event.target.data);
            var slides:Array = new Array();

        for each(var slide:XML in slidesXML.slide){
            slides.push(SlideVOFactory.CreateFromXML(slide));
        }




        this.slides = slides;

        dispatchEvent(new Event(Event.COMPLETE));
    }
}
}
