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

import starling.display.Sprite;
import starling.events.TouchEvent;

public class Thumbgroup extends Sprite
{

    private var _appmodel:AppModel;
    private var _thumb:Thumb;

    public function Thumbgroup()
    {

        this._appmodel = AppModel.getInstance();

        var yPos:Number = 0;
        var xPos:Number = 0;

        for each(var slideVO:SlideVO in _appmodel.arraySlides)
        {


            _thumb = new Thumb(slideVO);
            _thumb.x = xPos;
            _thumb.y = yPos;
            addChild(_thumb);

            xPos += 120;
        }

    }


}
}
