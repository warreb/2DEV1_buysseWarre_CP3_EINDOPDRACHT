/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 22/11/12
 * Time: 20:43
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.model.AppModel;
import flash.display.BitmapData;
import flash.display.StageDisplayState;
import flash.events.MouseEvent;
import starling.core.Starling;
import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class FullscreenButton extends starling.display.Sprite
{

    private var _appmodel:AppModel;
    private var _fullscreenbutton:Button;
    public function FullscreenButton()
    {
        this._appmodel = AppModel.getInstance();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(e:starling.events.Event):void
    {

        var bfsbtn:BasisFullscreenButton = new BasisFullscreenButton();
        var bitmapdata = new BitmapData(bfsbtn.width, bfsbtn.height,true,0x000000);

        bitmapdata.draw(bfsbtn);

        var texture:Texture = starling.textures.Texture.fromBitmapData(bitmapdata);
        _fullscreenbutton = new Button(Texture.fromBitmapData(bitmapdata),"");
        _fullscreenbutton.addEventListener(starling.events.Event.TRIGGERED,fullscreenHandler);
        addChild(_fullscreenbutton);

        _fullscreenbutton.addEventListener(MouseEvent.CLICK, fullscreenHandler);

    }

    private function fullscreenHandler(event:starling.events.Event):void
    {
       if(Starling.current.nativeStage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE)
        {
            Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
            _appmodel.isFullscreen = false;
        }
        else
        {
            Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
            _appmodel.isFullscreen = true;
        }
    }
}
}
