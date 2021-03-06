/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 10:12
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.factory {
import be.devine.cp3.presentation.vo.BulletElementVO;
import be.devine.cp3.presentation.vo.ElementVO;
import be.devine.cp3.presentation.vo.ImageElementVO;
import be.devine.cp3.presentation.vo.TextElementVO;

public class ElementVOFactory {

    public static function createFromXML(elementXML:XML): ElementVO{

        switch("" + elementXML.@type)
        {
            case "titel": return createTitelElementVO(elementXML);
            case 'subtitel': return createSubtitelElementVo(elementXML);
            case "image": return createImageElementVO(elementXML);
            case "bullet": return createBulletElementVO(elementXML);
        }
        return null;
    }

    private static function createSubtitelElementVo(info:XML):TextElementVO{
        var elementvo:TextElementVO = new TextElementVO();
        elementvo.text = info;
        elementvo.size = 20;

        return elementvo;
    }

    public static function createTitelElementVO(info:XML):TextElementVO{
        var elementvo:TextElementVO = new TextElementVO();
        elementvo.text = info;
        elementvo.size = 40;

        return elementvo;
    }

    public static function createImageElementVO(info:XML):ImageElementVO{
        var elementvo:ImageElementVO = new ImageElementVO();
        elementvo.url = info;
        return elementvo;
    }

    public static function createBulletElementVO(info:XML):BulletElementVO{

        var elementvo: BulletElementVO = new BulletElementVO();

        for each(var bullet:XML in info.bullets.bullet){
            elementvo.Bullets.push(bullet);
        }

        return elementvo;
    }
}
}
