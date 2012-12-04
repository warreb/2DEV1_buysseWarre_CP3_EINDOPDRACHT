/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 26/11/12
 * Time: 22:22
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.model.AppModel;

import flash.events.MouseEvent;

public class ArrowButton extends BasisArrow
{

    private var _label:String;
    private var _appModel:AppModel;


    public function ArrowButton(label:String)
    {
        this._label = label;
        this._appModel = AppModel.getInstance();

        this.stop();
        this.buttonMode = true;
        this.mouseChildren = false;

        switch(_label)
        {
            case 'next':
                this.gotoAndStop(2);
                break;

            case 'prev':
                this.gotoAndStop(4);
                break;
        }

        this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.addEventListener(MouseEvent.CLICK, mouseClickHandler);
    }


    private function mouseOverHandler(e:MouseEvent):void
    {
        this.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);

        this.gotoAndStop(this.currentFrame -1);
    }

    private function mouseOutHandler(e:MouseEvent):void
    {
        this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);

        this.gotoAndStop(this.currentFrame +1);
    }

    private function mouseClickHandler(e:MouseEvent):void
    {
        switch(_label)
        {
            case 'next':
                _appModel.goToNextSlide();
            break;

            case 'prev':
                _appModel.goToPreviousSlide();
            break;
        }
    }
}
}
