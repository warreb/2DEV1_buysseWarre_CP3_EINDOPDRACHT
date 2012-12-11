/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 23/11/12
 * Time: 01:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.vo.SlideVO;
import flash.events.Event;
import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Sprite;
import starling.events.Event;

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
        _appmodel.addEventListener(AppModel.THUMB_POSITION_CHANGED, thumbPositionChangedHandler);
    }

    private function thumbPositionChangedHandler(event:flash.events.Event):void
    {
        if(this.y == stage.stageHeight)
        {
            var twn:Tween = new Tween(this,.5, Transitions.EASE_IN_OUT);
            twn.animate("y", stage.stageHeight - 140);
            Starling.juggler.add(twn);
        }
        else
        {
            var t:Tween = new Tween(this,.5, Transitions.EASE_IN_OUT);
            t.animate("y", stage.stageHeight);
            Starling.juggler.add(t);
        }
    }

    private function slideChangedHandler(event:flash.events.Event):void {

        var xPos:Number = stage.stageWidth/2 ;
        var xPosTotalKleiner: Number =  0;

        for each(var _thumb:Thumb in _thumbArr){
            if(_thumb.slideVO.slideNr < _appmodel.activeSlide){
                xPosTotalKleiner += (_thumb.width + 6 );
            }
        }


        for each(var _thumb:Thumb in _thumbArr){

            if(_thumb.slideVO.slideNr == _appmodel.activeSlide ){
                var twn:Tween = new Tween(_thumb,.5,Transitions.EASE_OUT);
                twn.moveTo(xPos -  _thumb.width/2,0)
                Starling.juggler.add(twn);

            }

            if(_thumb.slideVO.slideNr > _appmodel.activeSlide ){
                var an:Tween = new Tween(_thumb,.5,Transitions.EASE_OUT);
                an.moveTo((xPos - _thumb.width/2) + (( _thumb.slideVO.slideNr - _appmodel.activeSlide ) * (_thumb.width + 6) ),0)

                Starling.juggler.add(an);
            }

            if(_thumb.slideVO.slideNr < _appmodel.activeSlide){
                var t:Tween = new Tween(_thumb,.5,Transitions.EASE_OUT);
                t.moveTo((xPos - _thumb.width/2) - xPosTotalKleiner,0)

                Starling.juggler.add(t);
                xPosTotalKleiner -= (_thumb.width + 6 );
            }

            setChildIndex(_thumb,_thumb.slideVO.slideNr);
        }
    }

    private function addedToStageHandler(event:starling.events.Event):void {

        var yPos:Number = 0;
        var xPos:Number = stage.stageWidth/2 ;

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

            _thumbArr.push(_thumb);

            _thumb.y = yPos;
            addChild(_thumb);
        }
    }
}
}
