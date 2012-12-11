/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 25/09/12
 * Time: 15:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.queue {
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;

public class Task extends Sprite
{
    private var _url:String;
    private var _naam:String;
    private var _image:Loader;

    public static const TASK_DONE:String = "TASK_DONE";

    public function Task(url:String, naam:String='')
    {
        _naam = naam;
        _url = url;

        _image = new Loader();
        _image.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
    }

    public function execute():void
    {
        loadImage();
    }

    private function loadImage():void
    {
        var request = new URLRequest(_url);
       _image.load(request);
    }

    private function completeHandler(e:Event):void
    {
        dispatchEvent(new Event(Task.TASK_DONE));
        addChild(_image);
    }

    public function get naam():String
    {
        return _naam;
    }

    public function set naam(value:String):void
    {
        _naam = value;
    }

    override public function toString():String
    {
        return "[Task] Identifier =" + this._url;
    }

    public function get image():Loader
    {
        return _image;
    }

    public function get url():String {
        return _url;
    }
}
}
