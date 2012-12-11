/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 25/09/12
 * Time: 15:18
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.queue
{

import flash.events.Event;
import flash.events.EventDispatcher;

public class Queue extends EventDispatcher
{
    public static const QUEUE_COMPLETE:String = 'queueComplete';

    private var _tasks:Array;
    private var _currentTask:int = -1;

    public function Queue()
    {
        _tasks = new Array();
    }

    public function add(task:Task):void
    {
        _tasks.push(task);
    }

    public function start():void
    {
        this.currentTask = 0;

        for each(var task:Task in _tasks)
        {
            task.addEventListener(Task.TASK_DONE, taskDoneHandler);
        }
    }

    private function loadNextTask():void
    {
        var taskToLoad:Task = _tasks[_currentTask];
        taskToLoad.execute();
    }

    private function taskDoneHandler(e:Event):void
    {
        this.currentTask ++;
    }

    public function get currentTask():int
    {
        return _currentTask;
    }

    public function set currentTask(value:int):void
    {
        if(_currentTask != value)
        {
            _currentTask = value;
            if(currentTask < _tasks.length)
            {
                loadNextTask();
            }
            else
            {
                dispatchEvent(new Event(QUEUE_COMPLETE));
            }
        }
    }

    public function get tasks():Array
    {
        return _tasks;
    }
}
}
