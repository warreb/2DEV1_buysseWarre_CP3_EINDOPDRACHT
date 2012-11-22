/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 20/11/12
 * Time: 19:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation
{
import be.devine.cp3.presentation.components.Background;
import be.devine.cp3.presentation.components.FullscreenButton;
import be.devine.cp3.presentation.model.AppModel;

import flash.display.BitmapData;

import flash.display.Loader;

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.net.URLRequest;


public class Application extends Sprite
{
    private var _loader:Loader;
    private var _bitmapData:BitmapData;
    private var _pattern:Sprite;

    private var _appModel:AppModel;
    private var _background:Background;
    private var _fullscreenbutton;



    public function Application()
    {

        _appModel = new AppModel();
        layout();


    }

    private function layout():void
    {

        _background = new Background();
        addChild(_background);

        _fullscreenbutton = new FullscreenButton(_appModel);
        addChild(_fullscreenbutton);

    }

}
}
