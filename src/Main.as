package {

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
import flash.net.URLRequest;
import flash.text.TextField;
import flash.utils.getDefinitionByName;


public class Main extends MovieClip
{
    // Properties


    private var _app:DisplayObject;
    private var _preloader:Sprite;

    // Constructor
    public function Main()
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        _preloader = new Sprite();
        _preloader.x = (stage.stageWidth - 100) /2;
        _preloader.y = (stage.stageHeight - 50) /2;
        addChild(_preloader);

        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 1024;
        stage.nativeWindow.height = 786;
        stage.nativeWindow.x = (Screen.mainScreen.bounds.width - stage.nativeWindow.width) / 2;
        stage.nativeWindow.y = (Screen.mainScreen.bounds.height - stage.nativeWindow.height) / 2;
        stage.nativeWindow.title ="Thisplay - Presentation";



        if( loaderInfo.bytesLoaded != loaderInfo.bytesTotal)
        {
            this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, swfProgressHandler);
            this.loaderInfo.addEventListener(Event.COMPLETE, swfCompleteHandler);
        }
        else
        {
            startApp();
        }
    }

    // Methods


    private function swfProgressHandler(e:ProgressEvent):void
    {
        var p:Number = (e.bytesLoaded / e.bytesTotal) * 100;

        trace("bytesloaded: " + e.bytesLoaded);
        trace("bytestotal: " + e.bytesTotal);

        _preloader.graphics.clear();
        _preloader.graphics.beginFill( 0xff0000, 1 );
        _preloader.graphics.drawRect( 0, 0, p,100 );
        _preloader.graphics.endFill();

    }

    private function swfCompleteHandler(e:Event):void
    {
        startApp();
    }

    private function startApp():void
    {
        this.gotoAndStop("start");


        var AppClass:Class = getDefinitionByName("be.devine.cp3.presentation.Application") as Class;
        _app = new AppClass();
        addChild( _app );
    }

}
}
