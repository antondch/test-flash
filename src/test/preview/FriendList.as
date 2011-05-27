package test.preview
{

import flash.events.Event;
import flash.events.EventDispatcher;

import test.mvcengine.IModel;

public class FriendList extends EventDispatcher implements IModel
{
    public var users:Vector.<FriendItem>;

    public function change():void
    {
        this.dispatchEvent(new Event(Event.CHANGE));
    }

    public function FriendList()
    {
        users = new Vector.<FriendItem>();
    }

    public function setAppUsers(users:Array):void
    {
        trace("FriendsList.setAppUsers " + users.length);
        this.users = new Vector.<FriendItem>();
        for (var i:int = 0; i < users.length; i++)
        {
            var item:FriendItem = new FriendItem();
            item.uid = users[i].uid;
            item.pic = users[i].pic;
            item.firstName = users[i].first_name;
            item.lastName = users[i].last_name;
            this.users.push(item);
        }
    }

    public function getUserById(uid:String):FriendItem
    {
        var item:FriendItem = new FriendItem();
        for (var i:int = 0; i < users.length; i++)
        {
            if (users[i].uid == uid)
            {
                item = users[i];
                break;
            }
        }
        return item;
    }

}
}
