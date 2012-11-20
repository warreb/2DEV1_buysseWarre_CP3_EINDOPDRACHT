/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 20/11/12
 * Time: 19:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation
{
import be.devine.cp3.presentation.model.AppModel;

import flash.display.Sprite;
import flash.display.StageDisplayState;


public class Application extends Sprite
{

    private var _appModel:AppModel;

    public function Application()
    {
        _appModel = new AppModel();
    }
}
}
