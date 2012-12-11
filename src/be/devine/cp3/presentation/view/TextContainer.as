/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 26/11/12
 * Time: 19:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.style;
import be.devine.cp3.presentation.vo.TextElementVO;

import flash.display.Sprite;

import starling.display.Sprite;

import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextContainer extends Container
{

    private var _helveticaNeueLight:HelveticaNeueLight;
    private var _agencyFB:AgencyFont;

    style.Agency;
    style.Verdana;

    public function TextContainer(txtelement:TextElementVO)
    {
        super(txtelement);

        var starlingtext: starling.text.TextField = new starling.text.TextField(587,50,txtelement.text,"Agency",txtelement.size,0X000000);
        starlingtext.hAlign = HAlign.CENTER;
        starlingtext.vAlign = VAlign.TOP;
        starlingtext.autoScale = true;
        addChild(starlingtext);
    }
}
}
