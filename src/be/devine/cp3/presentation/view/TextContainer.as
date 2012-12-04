/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 26/11/12
 * Time: 19:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
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



    public function TextContainer(txtelement:TextElementVO)
    {
            super(txtelement)

        trace("in de textcontainer");

        var starlingtext: starling.text.TextField = new starling.text.TextField(300,100,txtelement.text,Color.AQUA.toString());

        starlingtext.hAlign = HAlign.LEFT;
        starlingtext.vAlign = VAlign.TOP;
        addChild(starlingtext);

      /*  _agencyFB = new AgencyFont();

        _textFormat = new TextFormat();
        _textFormat.font = _agencyFB.fontName;
        _textFormat.align = TextFormatAlign.LEFT;*/

       /* switch(type)
        {
            case 'titel':
                _titel = new TextField();
                _titel.text = text.toUpperCase();
                _textFormat.size = fontSize;
                _titel.setTextFormat(_textFormat);
                _titel.defaultTextFormat = _textFormat;
                _titel.autoSize = TextFieldAutoSize.LEFT;
                _titel.embedFonts = true;
                _titel.antiAliasType = AntiAliasType.ADVANCED;
                _titel.textColor = 0x000;

                break;

            case 'thumb':
                    trace(text);
                _thumb = new TextField();
                _thumb.text = text;
                _textFormat.size = fontSize;
                _thumb.setTextFormat(_textFormat);
                _thumb.defaultTextFormat = _textFormat;
                _thumb.autoSize = TextFieldAutoSize.LEFT;
                _thumb.embedFonts = true;
                _thumb.antiAliasType = AntiAliasType.ADVANCED;
                _thumb.textColor = 0x000;
            break;
        }*/






    }
}
}
