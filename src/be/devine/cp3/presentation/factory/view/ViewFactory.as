/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 11:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.factory.view {
import be.devine.cp3.presentation.view.BulletContainer;
import be.devine.cp3.presentation.view.Container;
import be.devine.cp3.presentation.view.ImageContainer;
import be.devine.cp3.presentation.view.TextContainer;
import be.devine.cp3.presentation.vo.BulletElementVO;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.ImageElementVO;
import be.devine.cp3.presentation.vo.TextElementVO;

import starling.display.Sprite;

public class ViewFactory {

    public static function createFromElementVO(elementvo:ElementVO):Container{
        if(elementvo is TextElementVO){
            return new TextContainer(elementvo as TextElementVO);
        }

        if(elementvo is ImageElementVO){
            return new ImageContainer(elementvo as ImageElementVO)
        }

        if(elementvo is BulletElementVO){
            return new BulletContainer(elementvo as BulletElementVO)
        }

        return new Container(elementvo);


    }
}
}
