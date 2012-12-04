/**
 * Created with IntelliJ IDEA.
 * User: siebevandijck
 * Date: 4/12/12
 * Time: 13:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.view {
import be.devine.cp3.presentation.queue.Queue;
import be.devine.cp3.presentation.queue.Task;
import be.devine.cp3.presentation.service.StarlingService;
import be.devine.cp3.presentation.vo.ImageElementVO;

import flash.display.Sprite;

import flash.events.Event;

import flash.net.URLLoader;

import starling.display.Image;

public class ImageContainer extends Container{

    private var _queue:Queue;

    public function ImageContainer(imagevo:ImageElementVO) {
        super(imagevo);


            this.x = 25;

        _queue = new Queue();

        var task: Task = new Task("assets/images/" + imagevo.url,"image");

        _queue.add(task);

        _queue.addEventListener(Queue.QUEUE_COMPLETE,loadedHandler);
        _queue.start();


    }

    private function loadedHandler(event:flash.events.Event):void {
        trace(this);

        for each(var task:Task in _queue.tasks){


            var imgSprite: flash.display.Sprite = new flash.display.Sprite();




            imgSprite.addChild(task.image);

            var img: Image = StarlingService.MakeStarlingImg(imgSprite);
            addChild(img);





        }
    }
}
}
