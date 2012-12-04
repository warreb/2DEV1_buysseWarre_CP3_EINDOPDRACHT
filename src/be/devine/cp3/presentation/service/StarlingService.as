/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 16:34
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.service {
import flash.display.BitmapData;
import flash.display.DisplayObject;

import starling.display.Image;
import starling.textures.Texture;

public class StarlingService {

    public  static function MakeStarlingImg(object:DisplayObject):Image{

        var bitmapdata = new BitmapData(object.width, object.height,true,0x000000);

        bitmapdata.draw(object);


        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmapData(bitmapdata);
        var image:Image = new Image(texture);

        return image;

    }
}
}
