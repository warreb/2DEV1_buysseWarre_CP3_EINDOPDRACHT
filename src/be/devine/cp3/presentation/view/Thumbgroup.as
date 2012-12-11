/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 23/11/12
 * Time: 01:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.factory.SlideVOFactory;
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.service.StarlingService;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.SlideVO;

import flash.events.Event;

import starling.animation.Transitions;

import starling.animation.Tween;

import starling.core.Starling;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;

public class Thumbgroup extends Sprite
{

    private var _appmodel:AppModel;
    private var _thumb:Thumb;
    private var _thumbArr: Array;

    public function Thumbgroup()
    {

        _thumbArr = new Array();

        this._appmodel = AppModel.getInstance();



        this.addEventListener(starling.events.Event.ADDED_TO_STAGE,addedToStageHandler);
        _appmodel.addEventListener(AppModel.SELECTED_SLIDE_CHANGED,slideChangedHandler);
        _appmodel.addEventListener(AppModel.STAGESIZE_CHANGED,slideChangedHandler);



    }

    private function slideChangedHandler(event:flash.events.Event):void {

        var xPos:Number = stage.stageWidth/2 ;
        var xPosTotalKleiner: Number =  0;

        trace ("xPos is nu " + xPos);

        for each(var _thumb in _thumbArr){
            if(_thumb.slideVO.slideNr < _appmodel.activeSlide){
                trace("kleinerdan");
                xPosTotalKleiner += (_thumb.width + 6 );
            }
        }

        trace(xPosTotalKleiner);


        for each(var _thumb in _thumbArr){

            if(_thumb.slideVO.slideNr == _appmodel.activeSlide ){
                var tween:Tween = new Tween(_thumb,.5,Transitions.EASE_OUT);
                tween.moveTo(xPos -  _thumb.width/2,0)
                Starling.juggler.add(tween);

            }

            if(_thumb.slideVO.slideNr > _appmodel.activeSlide ){
                var tween:Tween = new Tween(_thumb,.5,Transitions.EASE_OUT);
                tween.moveTo((xPos - _thumb.width/2) + (( _thumb.slideVO.slideNr - _appmodel.activeSlide ) * (_thumb.width + 6) ),0)

                Starling.juggler.add(tween);
            }

            if(_thumb.slideVO.slideNr < _appmodel.activeSlide){
                var tween:Tween = new Tween(_thumb,.5,Transitions.EASE_OUT);
                tween.moveTo((xPos - _thumb.width/2) - xPosTotalKleiner,0)

                Starling.juggler.add(tween);
                xPosTotalKleiner -= (_thumb.width + 6 );
            }

            setChildIndex(_thumb,_thumb.slideVO.slideNr);

            trace(_thumb.x);
        }

    }

    private function addedToStageHandler(event:starling.events.Event):void {

        var yPos:Number = 0;
        var xPos:Number = stage.stageWidth/2 ;
        trace ("xPos is " + xPos);

        for each(var slideVO:SlideVO in _appmodel.arraySlides)
        {
            _thumb = new Thumb(slideVO);

            if(slideVO.slideNr == _appmodel.activeSlide ){
                _thumb.x = xPos -  _thumb.width/2;
            }

            if(slideVO.slideNr > _appmodel.activeSlide ){
                _thumb.x = (xPos - _thumb.width/2) + (Math.abs(slideVO.slideNr) * (_thumb.width + 6) )  ;
            }

            if(slideVO.slideNr < _appmodel.activeSlide){
                _thumb.x = (xPos - _thumb.width/2) - (Math.abs(slideVO.slideNr) * (_thumb.width + 6 )) ;
            }

            trace(xPos);



            _thumbArr.push(_thumb);


            _thumb.y = yPos;
            addChild(_thumb);

        }

    }


}
}
