/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 10:04
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.factory {
import be.devine.cp3.presentation.vo.SlideVO;

public class SlideVOFactory {

    public static function CreateFromXML(SlideXML:XML,slidenr:uint){

        var slidevo:SlideVO = new SlideVO();

        for each (var xmlElement:XML in SlideXML.slideElements.element){
            slidevo.list.push(ElementVOFactory.createFromXML(xmlElement));
            slidevo.slideNr = slidenr;



        }


        return slidevo;
    }
}
}
