/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 22/11/12
 * Time: 20:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view
{
import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Background extends starling.display.Sprite
{

    private var _loader:Loader;
    private var _bitmapData:BitmapData;
    private var _pattern:flash.display.Sprite;

    private var _img:Image;

    public function Background()
    {
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE,init);
    }

    private function init(e:starling.events.Event):void
    {
        _loader = new Loader();
        _loader.load(new URLRequest("assets/debut_light.png"));
        _loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, loaderComplete);
    }

    private function loaderComplete(e:flash.events.Event):void
    {
        _bitmapData = new BitmapData(_loader.width, _loader.height);
        _bitmapData.draw(_loader);
        _pattern = new flash.display.Sprite();
        stage.addEventListener(starling.events.Event.RESIZE, resizeHandler);

        resizeHandler(null)
    }

    private function resizeHandler(e:starling.events.Event):void
    {
        if(_img != null)
            removeChild(_img);

        _pattern.graphics.clear();
        _pattern.graphics.beginBitmapFill(_bitmapData);
        _pattern.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        _pattern.graphics.endFill();

        var bmpdata:BitmapData = new BitmapData(stage.stageWidth,stage.stageHeight);
        bmpdata.draw(_pattern);

        var textre:Texture = Texture.fromBitmapData(bmpdata,false,false);
        _img = new Image(textre);
        addChild(_img);
    }
}
}
