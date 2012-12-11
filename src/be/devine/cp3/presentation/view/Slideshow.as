/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 23/11/12
 * Time: 01:33
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.factory.view.ViewFactory;
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.queue.Queue;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.SlideVO;

import flash.display.Bitmap;

import flash.display.BitmapData;


import flash.display.Sprite;

import flash.events.Event;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class Slideshow extends starling.display.Sprite
{

    private var _appmodel:AppModel;
    private var _queue:Queue;
    private var _arraySlides:Array;

    private var _prevArrow:BasisArrow;
    private var _nextArrow:BasisArrow;

    private var _slideVO:SlideVO;

    private var _isCurrentSlideChanged:Boolean = false;

    public function Slideshow(slidevo:SlideVO)
    {


        this._slideVO = slidevo;


        this._appmodel = AppModel.getInstance();

        var presentationSlide:flash.display.Sprite = new flash.display.Sprite();
        presentationSlide.graphics.beginFill(0xFFFFFF);
        presentationSlide.graphics.drawRect(0,0,587, 587);
        presentationSlide.graphics.endFill();

        var presentationBmpData: BitmapData = new BitmapData(presentationSlide.width,presentationSlide.height);

        presentationBmpData.draw(presentationSlide);

        var presentationBmp: Bitmap = new Bitmap(presentationBmpData);

        var presentationtexture: Texture = Texture.fromBitmap(presentationBmp);
        var presentationbg:Image = new Image(presentationtexture);
        addChild(presentationbg);

        var currentheight:Number = 0;
        for each(var elementvo:ElementVO in _slideVO.list){
        var element:Container = ViewFactory.createFromElementVO(elementvo);
            element.y = currentheight;
            addChild(element);
            if(element.height == 0){
                currentheight += 200;
            }else{
                currentheight += element.height + 10;
            }

         }

    }

   private function slideChangedHandler(event:Event):void
    {


        trace(" de slides zijn gechanged");

        trace(_appmodel.arraySlides[0]);





    }


    private function show():void
    {
        if(_isCurrentSlideChanged)
        {
            _isCurrentSlideChanged = false;

            trace('executing display');

            for each(var slide:Sprite in _arraySlides)
            {
                var activeSlideIndex:uint = _arraySlides.indexOf(slide);

                if(_appmodel.activeSlide != (activeSlideIndex +1))
                {
                    slide.visible = false;
                }
                else
                {
                    slide.visible = true;
                }
            }
        }
    }
}
}
