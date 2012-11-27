/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 20/11/12
 * Time: 22:12
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.model
{
import flash.events.Event;
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher
{

    private static var instance:AppModel;

    public static function getInstance():AppModel
    {
        if(instance == null)
        {
            instance = new AppModel(new Enforcer());
        }
        return instance;
    }

    public static const SELECTED_SLIDE_CHANGED:String = "selectedSlideChanged";
    public static const SLIDES_CHANGED:String = "slideChanged";


    private var _isFullscreen:Boolean;
    private var _arraySlides:Array;

    private var _activeSlide:uint;

    public function AppModel(e:Enforcer)
    {
        if(e == null)
        {
            throw new Error("Appmodel is a singleton");
        }
    }


    //IsFullscreen getter & setter
    public function get isFullscreen():Boolean
    {
        return _isFullscreen;
    }

    public function set isFullscreen(value:Boolean):void
    {
        if(_isFullscreen != value)
        {
            _isFullscreen = value;
        }
    }


    //arraySlides getter & setter
    public function get arraySlides():Array {
        return _arraySlides;
    }

    public function set arraySlides(value:Array):void
    {
        if(_arraySlides != value)
        {
            _arraySlides = value;
            dispatchEvent(new Event(AppModel.SLIDES_CHANGED));
        }
    }


    public function goToPreviousSlide():void
    {
        if(_activeSlide - 1 > 0)
        {
            activeSlide --;
        }
        else
        {
            activeSlide = _arraySlides.length;
        }
    }

    public function goToNextSlide():void
    {
        if(_activeSlide + 1 <= _arraySlides.length)
        {
            activeSlide ++;
        }
        else
        {
            activeSlide = 1;
        }
    }


    //activeSlide getter & setter
    public function get activeSlide():uint
    {
        return _activeSlide;
    }

    public function set activeSlide(value:uint):void
    {
        if(_activeSlide != value)
        {
            _activeSlide = value;
            dispatchEvent(new Event(AppModel.SELECTED_SLIDE_CHANGED));
        }
    }
}


}
internal class Enforcer{};