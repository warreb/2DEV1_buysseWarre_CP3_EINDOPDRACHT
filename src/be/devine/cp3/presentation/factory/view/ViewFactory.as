/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 11:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.factory.view {
import be.devine.cp3.presentation.view.Container;
import be.devine.cp3.presentation.view.TextContainer;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.TextElementVO;

import starling.display.Sprite;

public class ViewFactory {

    public static function createFromElementVO(elementvo:ElementVO):Container{
        trace("test in viewfactory");
        if(elementvo is TextElementVO){
            return new TextContainer(elementvo as TextElementVO);
        }

        return new Container(elementvo);


    }
}
}
