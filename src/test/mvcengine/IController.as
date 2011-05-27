package test.mvcengine
{

import flash.events.Event;
import flash.events.IEventDispatcher;

public interface IController extends IEventDispatcher
{
    function handler(e:Event):void;
}
}
