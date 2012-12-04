/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 20/11/12
 * Time: 19:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation
{
import be.devine.cp3.presentation.view.Background;
import be.devine.cp3.presentation.view.FullscreenButton;
import be.devine.cp3.presentation.view.Slideshow;
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.service.SlideService;
import be.devine.cp3.presentation.vo.SlideVO;
import be.devine.cp3.presentation.xml.XMLParser;

import flash.display.Bitmap;

import flash.display.BitmapData;
import flash.display.DisplayObject;

import flash.display.Loader;
import flash.display.MovieClip;

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.display3D.textures.Texture;
import flash.events.Event;
import flash.net.URLRequest;

import org.osmf.logging.Log;

import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;


public class Application extends starling.display.Sprite
{
    private var _loader:Loader;
    private var _bitmapData:BitmapData;
    private var _pattern:Sprite;

    private var _appModel:AppModel;

    private var _background:Background;
    private var _fullscreenbutton;

    private var _slideshow:Slideshow;

    private var _logo:Image;
    private var _xmlparser:XMLParser;
    private var _slideVO:SlideVO;

    private var slideservice:SlideService;




    public function Application()
    {


        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        this._appModel = AppModel.getInstance();

        slideservice = new SlideService();
        slideservice.addEventListener(flash.events.Event.COMPLETE,slidesCompleteHandler);
        slideservice.load();

        _appModel.addEventListener(AppModel.SLIDES_CHANGED,slideChangedHandler);





    }

    private function slideChangedHandler(e:flash.events.Event):void {

        trace("tester");
        _slideshow  = new Slideshow(_appModel.arraySlides[_appModel.activeSlide]);
        addChild(_slideshow);

        _slideshow.x = (stage.stageWidth/2) - (587/2);
        _slideshow.y = (stage.stageHeight/5);
    }

    private function slidesCompleteHandler(e:flash.events.Event):void {
       _appModel.arraySlides = slideservice.slides;
        _appModel.activeSlide = _appModel.arraySlides[0];

    }



    private function addedToStageHandler(e:starling.events.Event):void
    {
        stage.addEventListener(starling.events.Event.RESIZE, rearrange);
        layout();
    }

    private function layout():void
    {
        _background = new Background();
         addChild(_background);

        var bfsLogo:Logo = new Logo();
        _logo = MakeStarlingImg(bfsLogo);
        addChild(_logo);





         _fullscreenbutton = new FullscreenButton();
         addChild(_fullscreenbutton);

       rearrange(null);


    }

    private function MakeStarlingImg(object:DisplayObject):Image{

        var bitmapdata = new BitmapData(object.width, object.height,true,0x000000);

        bitmapdata.draw(object);


        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmapData(bitmapdata);
        var image:Image = new Image(texture);

        return image;

    }

    private function rearrange(e:starling.events.Event):void
    {

        _logo.x = (stage.stageWidth/2) - (_logo.width/2);
        _logo.y = 25;

        //_slideshow.x = (stage.stageWidth/2) - (587/2);
       //_slideshow.y = (stage.stageHeight/6);
    }

}
}
