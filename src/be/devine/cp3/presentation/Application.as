/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 20/11/12
 * Time: 19:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation
{
import be.devine.cp3.presentation.service.StarlingService;
import be.devine.cp3.presentation.view.Background;
import be.devine.cp3.presentation.view.FullscreenButton;
import be.devine.cp3.presentation.view.Thumb;
import be.devine.cp3.presentation.view.Slideshow;
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.service.SlideService;
import be.devine.cp3.presentation.view.Thumbgroup;
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

    private var _appModel:AppModel;

    private var _background:Background;
    private var _fullscreenbutton;

    private var _slideshow:Slideshow;
    private var _thumbgroup:Thumbgroup;

    private var _logo:Image;

    private var _slideservice:SlideService;




    public function Application()
    {


        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        this._appModel = AppModel.getInstance();

        _slideservice = new SlideService();
        _slideservice.addEventListener(flash.events.Event.COMPLETE,slidesCompleteHandler);
        _slideservice.load();

        _appModel.addEventListener(AppModel.SLIDES_CHANGED,slideChangedHandler);


    }

    private function slideChangedHandler(e:flash.events.Event):void
    {

        //Slideshow aanmaken
        _slideshow = new Slideshow(_appModel.arraySlides[_appModel.activeSlide]);
        addChild(_slideshow);




        //Slidethumbs aanmaken
        _thumbgroup = new Thumbgroup(_appModel.arraySlides);
        addChild(_thumbgroup);

        _thumbgroup.x = (stage.stageWidth/2) - (_thumbgroup.width/2);
        _thumbgroup.y = stage.stageHeight - 140;

        _slideshow.x = (stage.stageWidth/2) - (587/2);
        _slideshow.y = (stage.stageHeight/5);

    }

    private function slidesCompleteHandler(e:flash.events.Event):void {

       _appModel.arraySlides = _slideservice.slides;
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
        _logo = StarlingService.MakeStarlingImg(bfsLogo);
        addChild(_logo);

         _fullscreenbutton = new FullscreenButton();
         addChild(_fullscreenbutton);


        _logo.x = (stage.stageWidth/2) - (_logo.width/2);
        _logo.y = 25;


    }



    private function rearrange(e:starling.events.Event):void
    {

        _logo.x = (stage.stageWidth/2) - (_logo.width/2);
        _logo.y = 25;


        _slideshow.x = (stage.stageWidth/2) - (587/2);
        _slideshow.y = (stage.stageHeight/6);

        _thumbgroup.x = (stage.stageWidth/2) - (_thumbgroup.width/2);
        _thumbgroup.y = (stage.stageHeight - 140);
    }

}
}
