package {

import be.devine.cp3.presentation.Application;
import be.devine.cp3.presentation.model.AppModel;

import flash.desktop.NativeApplication;

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.Screen;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageDisplayState;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.utils.getDefinitionByName;

import starling.core.Starling;

[SWF (frameRate='60')]
public class Main extends MovieClip
{
    // Properties

    private var _starling: Starling;



    // Constructor
    public function Main()
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;





        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 1024;
        stage.nativeWindow.height = 786;

        stage.nativeWindow.x = (Screen.mainScreen.bounds.width - stage.nativeWindow.width) / 2;
        stage.nativeWindow.y = (Screen.mainScreen.bounds.height - stage.nativeWindow.height) / 2;
        stage.nativeWindow.title ="Thisplay - Presentation";



        _starling = new Starling(Application, stage);
        _starling.start();

        stage.addEventListener(Event.RESIZE,resizehandler);

        resizehandler(null);


    }

    // Methods


    private function resizehandler(event:Event):void {


        var viewPortRectangle:Rectangle = new Rectangle();
        viewPortRectangle.width = stage.nativeWindow.width;
        viewPortRectangle.height = stage.nativeWindow.height;

        Starling.current.viewPort = viewPortRectangle;

        _starling.stage.stageWidth = stage.nativeWindow.width;
        _starling.stage.stageHeight = stage.nativeWindow.height;






    }
}
}
