/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 14:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.style;
import be.devine.cp3.presentation.vo.BulletElementVO;

import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class BulletContainer extends Container {

    style.Verdana;
    public function BulletContainer(bulletelement:BulletElementVO) {
        super(bulletelement);

        var yPos:Number = 0;
        var xPos:Number = 60;

        var nrOfBullets:uint = 1;

        for each(var bullet:String in bulletelement.Bullets){

            var starlingtext: starling.text.TextField = new starling.text.TextField(587,50,"- "+bullet,"Verdana",12,0X000000);

            starlingtext.hAlign = HAlign.LEFT;
            starlingtext.vAlign = VAlign.TOP;
            starlingtext.autoScale = true;
            starlingtext.x = xPos;
            starlingtext.y = yPos;
            addChild(starlingtext);

            yPos += 20;

            if(nrOfBullets % 4 == 0){
                yPos = 0;
                xPos +=100;
            }
            nrOfBullets +=1;
        }
    }
}
}
