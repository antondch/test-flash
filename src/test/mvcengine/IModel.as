package test.mvcengine
{

import flash.events.IEventDispatcher;

public interface IModel extends IEventDispatcher
{
    function change():void;
}
}
