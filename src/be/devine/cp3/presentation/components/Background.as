/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 22/11/12
 * Time: 20:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.components
{
import be.devine.cp3.presentation.model.AppModel;

import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;

public class Background extends Sprite
{

    private var _loader:Loader;
    private var _bitmapData:BitmapData;
    private var _pattern:Sprite;
    private var _appmodel:AppModel;

    public function Background()
    {
        this._appmodel = _appmodel;

        //////// Moet nog veranderd worden doordat added_to_stage niet meer mag. Oplossing
        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(e:Event):void
    {
        this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

        _pattern = new Sprite();
        addChild(_pattern);

        _loader = new Loader();
        _loader.load(new URLRequest("assets/debut_light.png"));
        _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderComplete);
    }

    private function loaderComplete(e:Event):void
    {
        _bitmapData = new BitmapData(_loader.width, _loader.height);
        _bitmapData.draw(_loader);

        setPattern();

        stage.addEventListener(Event.RESIZE, resizeHandler);
    }

    private function setPattern():void
    {
        _pattern.graphics.clear();
        _pattern.graphics.beginBitmapFill(_bitmapData);
        _pattern.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        _pattern.graphics.endFill();
    }

    private function resizeHandler(e:Event):void
    {
        setPattern();
    }
}
}
