/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 20/11/12
 * Time: 19:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation
{
import be.devine.cp3.presentation.components.Background;
import be.devine.cp3.presentation.components.FullscreenButton;
import be.devine.cp3.presentation.components.Slideshow;
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.vo.SlideVO;
import be.devine.cp3.presentation.xml.XMLParser;

import flash.display.BitmapData;

import flash.display.Loader;
import flash.display.MovieClip;

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.net.URLRequest;


public class Application extends MovieClip
{
    private var _loader:Loader;
    private var _bitmapData:BitmapData;
    private var _pattern:Sprite;

    private var _appModel:AppModel;

    private var _background:Background;
    private var _fullscreenbutton;

    private var _slideshow:Slideshow;

    private var _logo:Logo;
    private var _xmlparser:XMLParser;
    private var _slideVO:SlideVO;



    public function Application()
    {

        this._appModel = AppModel.getInstance();
        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

        _xmlparser = new XMLParser();
        _xmlparser.addEventListener(XMLParser.XML_LOADED, xmlLoadedHandler);
        _xmlparser.load("assets/xml/slides.xml");
    }

    private function xmlLoadedHandler(event:Event):void
    {


        var arraySlides:Array = new Array();

        var loadedData:XML = (event.currentTarget as XMLParser).ingeladenData;

        for each(var slideNode:XML in loadedData.slide)
        {
            arraySlides.push(slideNode);
        }

        _appModel.arraySlides = arraySlides;
    }

    private function resizeHandler(e:Event):void
    {
        rearrange();
    }

    private function addedToStageHandler(e:Event):void
    {
        stage.addEventListener(Event.RESIZE, resizeHandler);
        layout();
    }

    private function layout():void
    {

        _background = new Background();
        addChild(_background);

        _slideshow = new Slideshow();
        addChild(_slideshow);
        _slideshow.x = (stage.stageWidth/2) - (587/2);
        _slideshow.y = (stage.stageHeight/5);

        _fullscreenbutton = new FullscreenButton();
        addChild(_fullscreenbutton);

        _logo = new Logo();
        addChild(_logo);

        rearrange();
    }

    private function rearrange():void
    {
        _logo.x = (stage.stageWidth/2) - (_logo.width/2);
        _logo.y = 25;

        _slideshow.x = (stage.stageWidth/2) - (587/2);
        _slideshow.y = (stage.stageHeight/6);
    }

}
}
