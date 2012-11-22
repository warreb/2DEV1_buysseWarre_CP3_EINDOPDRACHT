/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 22/11/12
 * Time: 16:40
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.vo {
public class SlideVO
{

    private var _id:uint;
    private var _titel:String;
    private var _image_path:String;
    private var _subtitel:String;
    private var _list:Array;

    public function SlideVO( id:uint, titel:String, image_path:String, subtitel:String, list:Array)
    {
        this._id = id;
        this._titel = titel;
        this._image_path = image_path;
        this._subtitel = subtitel;
        this._list = list;

    }

    public function get id():uint {
        return _id;
    }

    public function set id(value:uint):void {
        _id = value;
    }

    public function get titel():String {
        return _titel;
    }

    public function set titel(value:String):void {
        _titel = value;
    }

    public function get image_path():String {
        return _image_path;
    }

    public function set image_path(value:String):void {
        _image_path = value;
    }

    public function get subtitel():String {
        return _subtitel;
    }

    public function set subtitel(value:String):void {
        _subtitel = value;
    }

    public function get list():Array {
        return _list;
    }

    public function set list(value:Array):void {
        _list = value;
    }
}
}
