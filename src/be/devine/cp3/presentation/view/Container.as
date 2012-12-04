/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 12:43
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.vo.ElementVO;

import starling.display.Sprite;

public class Container extends Sprite {

    protected var elementvo : ElementVO;
    public function Container(element:ElementVO) {
        this.elementvo = element;
    }
}
}
