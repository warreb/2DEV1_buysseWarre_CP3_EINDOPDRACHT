/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 11/12/12
 * Time: 01:17
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.service.StarlingService;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.SlideVO;

import flash.display.Bitmap;

import flash.display.BitmapData;
import flash.display.Sprite;

import flash.display.Sprite;
import flash.display3D.textures.Texture;
import flash.events.Event;

import starling.display.Button;

import starling.display.Button;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Thumb extends starling.display.Sprite
{

    private var _appModel:AppModel;
    private var _slideVO:SlideVO;
    private var _thumbBtn: Button;

  //  private var _currentHeight:Number = 0;

    private var _stThumbBorder:Image;



    public function Thumb(slideVO:SlideVO)
    {

        this._slideVO = slideVO;

        this._appModel = AppModel.getInstance();


        if (_appModel.activeSlide == _slideVO.slideNr){
            var thumbBorder:flash.display.Sprite = new flash.display.Sprite();
            thumbBorder.graphics.beginFill(0X000000);
            thumbBorder.graphics.drawRect(0,0, 101, 101);
            thumbBorder.graphics.endFill();
             _stThumbBorder = StarlingService.MakeStarlingImg(thumbBorder);

            addChild(_stThumbBorder);

        }
            var thumbSlide:flash.display.Sprite = new flash.display.Sprite();
            thumbSlide.graphics.beginFill(0xDEDEDE);
            thumbSlide.graphics.drawRect(1,1, 100, 100);
            thumbSlide.graphics.endFill();

            var thumbData: BitmapData = new BitmapData(thumbSlide.width,thumbSlide.height,true,0x000000);


            thumbData.draw(thumbSlide);

            var thumbBmp:Bitmap = new Bitmap(thumbData);

            _appModel.addEventListener(AppModel.SELECTED_SLIDE_CHANGED,changedSlideHandler);

            _thumbBtn = new Button(starling.textures.Texture.fromBitmap(thumbBmp));
            _thumbBtn.addEventListener(starling.events.Event.TRIGGERED,clickHandler);
            addChild(_thumbBtn);
    }

    private function changedSlideHandler(event:flash.events.Event):void {
        trace("slide changed");

        if(_stThumbBorder != null){
            removeChild(_stThumbBorder);
        }

        if (_appModel.activeSlide == _slideVO.slideNr){
            var thumbBorder:flash.display.Sprite = new flash.display.Sprite();
            thumbBorder.graphics.beginFill(0X000000);
            thumbBorder.graphics.drawRect(0,0, 101, 101);
            thumbBorder.graphics.endFill();
            _stThumbBorder = StarlingService.MakeStarlingImg(thumbBorder);

            addChild(_stThumbBorder);
            setChildIndex(_stThumbBorder,0);

        }
    }


    private function clickHandler(event:starling.events.Event):void {
        _appModel.activeSlide = _slideVO.slideNr;
    }

    public function get slideVO():SlideVO {
        return _slideVO;
    }

    public function set slideVO(value:SlideVO):void {
        _slideVO = value;
    }
}
}
