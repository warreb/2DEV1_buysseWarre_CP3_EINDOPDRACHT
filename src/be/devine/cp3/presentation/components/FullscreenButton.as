/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 22/11/12
 * Time: 20:43
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.components {
import be.devine.cp3.presentation.model.AppModel;

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.events.MouseEvent;

public class FullscreenButton extends Sprite
{

    private var _appmodel:AppModel;
    private var _fulscreenbutton:BasisFullscreenButton;
    public function FullscreenButton(appModel:AppModel)
    {
        this._appmodel = appModel;

        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(e:Event):void
    {

        _fulscreenbutton = new BasisFullscreenButton();
        _fulscreenbutton.addEventListener(MouseEvent.CLICK, fullscreenHandler);
        addChild(_fulscreenbutton);


        //this.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;

    }

    private function fullscreenHandler(event:MouseEvent):void
    {
        if(this.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE)
        {
            this.stage.displayState = StageDisplayState.NORMAL;
            _appmodel.isFullscreen = false;
        }
        else
        {
            this.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
            _appmodel.isFullscreen = true;
        }
    }
}
}
