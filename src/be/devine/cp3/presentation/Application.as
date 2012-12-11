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
import be.devine.cp3.presentation.view.Slideshow;
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.service.SlideService;
import be.devine.cp3.presentation.view.Thumbgroup;


import flash.display.StageDisplayState;
import flash.events.Event;


import starling.animation.Transitions;

import starling.animation.Tween;

import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;


public class Application extends starling.display.Sprite
{

    private var _appModel:AppModel;

    private var _background:Background;
    private var _fullscreenbutton:FullscreenButton;

    private var _slideshow:Slideshow;
    private var _thumbgroup:Thumbgroup;

    private var _logo:Image;
    private var slideservice:SlideService;

    public function Application()
    {
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        this._appModel = AppModel.getInstance();

        slideservice = new SlideService();
        slideservice.addEventListener(flash.events.Event.COMPLETE,slidesCompleteHandler);
        slideservice.load();

        _appModel.addEventListener(AppModel.SLIDES_CHANGED,slideChangedHandler);
        _appModel.addEventListener(AppModel.SELECTED_SLIDE_CHANGED,currentSlideChangedHandler);
        _appModel.addEventListener(AppModel.STAGESIZE_CHANGED, stageSizeChangedHandler);

    }


    private function addedToStageHandler(e:starling.events.Event):void
    {
        stage.addEventListener(starling.events.Event.RESIZE, rearrange);
        stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keydownhandler);
        layout();
    }

    private function stageSizeChangedHandler(event:flash.events.Event):void
    {
        rearrange(null);
    }

    private function currentSlideChangedHandler(event:flash.events.Event):void {

        switch(_appModel.slideTween){
            case 'left':
                var twn:Tween = new Tween(_slideshow,.5,Transitions.EASE_IN_OUT);
                twn.animate("x",stage.stageWidth);
                twn.onComplete = slideChangeTransition1Complete;
                Starling.juggler.add(twn);
                break;
            case 'right':
                var t:Tween = new Tween(_slideshow,.5, Transitions.EASE_IN_OUT);
                t.animate("x",-_slideshow.width-10);
                t.onComplete = slideChangeTransition1Complete;
                Starling.juggler.add(t);
                break;
            case 'click':
            default :
                var an:Tween = new Tween(_slideshow,.5, Transitions.EASE_IN_OUT);
                an.animate("alpha",0);
                an.onComplete = slideChangeTransition1Complete;
                Starling.juggler.add(an);
                break;
        }
    }

    private function slideChangeTransition1Complete():void{

        removeChild(_slideshow);

         _slideshow = new Slideshow(_appModel.arraySlides[_appModel.activeSlide]);
         addChild(_slideshow);
         _slideshow.alpha = 0;

        var tween:Tween = new Tween(_slideshow,.5);
        tween.animate("alpha",1);
        Starling.juggler.add(tween);

         _slideshow.x = (stage.stageWidth/2) - (587/2);
         _slideshow.y = (stage.stageHeight/5);
         setChildIndex(_slideshow,1);
    }

    private function slideChangedHandler(e:flash.events.Event):void
    {

        //Slideshow aanmaken
        _slideshow = new Slideshow(_appModel.arraySlides[_appModel.activeSlide]);
        addChild(_slideshow);

        //Slidethumbs aanmaken
        _thumbgroup = new Thumbgroup();
        addChild(_thumbgroup);
        setChildIndex(_thumbgroup, numChildren -1);

        _thumbgroup.x = 0;
        _thumbgroup.y = stage.stageHeight - 140;

        _slideshow.x = (stage.stageWidth/2) - (587/2);
        _slideshow.y = (stage.stageHeight/5);

    }

    private function slidesCompleteHandler(e:flash.events.Event):void {
       _appModel.arraySlides = slideservice.slides;
        _appModel.activeSlide = _appModel.arraySlides[0];
    }

    private function keydownhandler(event:KeyboardEvent):void
    {
         var keycode:Number = event.keyCode;

        switch(keycode)
        {
            case 32:
                _appModel.toggleThumbs();
            break;

            case 37:
                _appModel.slideTween = "left";
                _appModel.goToPreviousSlide();
                break;

            case 39:
                _appModel.slideTween = "right";
                _appModel.goToNextSlide();
                break;
            case 27:
                Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
                _appModel.isFullscreen = false;
                break;
        }
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
        if(_appModel.isFullscreen)
        {
            slideChangeTransition1Complete();
            var tween:Tween = new Tween(_logo,1, Transitions.EASE_IN_OUT);
            tween.animate("y", -100);
            Starling.juggler.add(tween);

            if(_background != null)
            {
                _background.alpha = 0;
            }
        }
        else
        {
            _background.alpha = 1;

            var t:Tween = new Tween(_logo,1
                    , Transitions.EASE_IN_OUT);
            t.animate("y", 25);
            Starling.juggler.add(t);
        }

        _logo.x = (stage.stageWidth/2) - (_logo.width/2);


        _slideshow.x = (stage.stageWidth/2) - (_slideshow.width/2);
        _slideshow.y = (stage.stageHeight/6);

        _thumbgroup.x = 0;
        _thumbgroup.y = (stage.stageHeight - 140);

        if(Starling.current.nativeStage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE )
        {
            slideChangeTransition1Complete();
        }else if(Starling.current.nativeStage.displayState == StageDisplayState.NORMAL)
        {
            slideChangeTransition1Complete();
        }
    }

}
}
