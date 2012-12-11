/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 11/12/12
 * Time: 01:17
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.SlideVO;

import flash.display.Bitmap;

import flash.display.BitmapData;

import flash.display.Sprite;
import flash.display3D.textures.Texture;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class Thumb extends starling.display.Sprite
{

    private var _appModel:AppModel;
    private var _slideVO:SlideVO;

    private var _currentHeight:Number = 0;



    public function Thumb(slideVO:SlideVO)
    {

        this._slideVO = slideVO;

        this._appModel = AppModel.getInstance();


            var thumbSlide:flash.display.Sprite = new flash.display.Sprite();
            thumbSlide.graphics.beginFill(0xDEDEDE);
            thumbSlide.graphics.drawRect(0,0, 100, 100);
            thumbSlide.graphics.endFill();

            var thumbData: BitmapData = new BitmapData(thumbSlide.width,thumbSlide.height);

            thumbData.draw(thumbSlide);

            var thumbBmp:Bitmap = new Bitmap(thumbData);

            var thumbTexture:starling.textures.Texture = starling.textures.Texture.fromBitmap(thumbBmp);
            var thumbBg:Image = new Image(thumbTexture);
            addChild(thumbBg);
    }
}
}
