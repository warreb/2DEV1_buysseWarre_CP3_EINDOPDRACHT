/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 23/11/12
 * Time: 01:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.model.AppModel;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.SlideVO;

import starling.display.Sprite;

public class Thumbgroup extends starling.display.Sprite
{

    private var _slideVO:SlideVO;
    private var _appmodel:AppModel;
    private var _thumb:Thumb;

    public function Thumbgroup(slideVO:SlideVO)
    {
        this._slideVO= slideVO;

        this._appmodel = AppModel.getInstance();

        var yPos:Number = 0;
        var xPos:Number = 0;

        for each(var elementVO:ElementVO in _slideVO.list)
        {

            trace("hoeveel kom ik hier?");
            _thumb = new Thumb(_slideVO);
            _thumb.x = xPos;
            _thumb.y = yPos;
            addChild(_thumb);

            xPos += 120;
        }

    }
}
}
