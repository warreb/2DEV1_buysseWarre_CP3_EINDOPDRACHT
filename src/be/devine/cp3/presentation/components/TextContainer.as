/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 26/11/12
 * Time: 19:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.components {
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

public class TextContainer extends Sprite
{

    private var _helveticaNeueLight:HelveticaNeueLight;
    private var _agencyFB:AgencyFont;
    private var _titel:TextField;
    private var _thumb:TextField;
    private var _textFormat:TextFormat;


    public function TextContainer(type:String, fontSize:int, text:String = '')
    {


        _agencyFB = new AgencyFont();

        _textFormat = new TextFormat();
        _textFormat.font = _agencyFB.fontName;
        _textFormat.align = TextFormatAlign.LEFT;

        switch(type)
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
        }


        addChild(_titel);



    }
}
}
