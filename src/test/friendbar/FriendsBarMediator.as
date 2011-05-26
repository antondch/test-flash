package dgJump.friendBar
{

import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

import signals.Alert;
import signals.fromModel.EduStarted;

public class FriendsBarMediator extends Mediator
{
    [Inject]
    public var friendsBar:FriendBarView;
    [Inject]
    public var inviteFriend:InviteFriend;
    [Inject]
    public var friendList:FriendList;
    [Inject]
    public var alert:Alert;
    [Inject]
    public var visitFriend:BattleFriendClicked;
    [Inject]
    public var eduStarted:EduStarted;

    private var items:Vector.<FriendItemView>;


    override public function onRegister():void
    {
        eduStarted.add(eduStartedHandler);

        items = new Vector.<FriendItemView>();
        for (var i:int = 0; i < 7; i++)
        {
            var addFriend:FriendItemView = new FriendItemView();
            friendsBar.addItem(addFriend);
            addFriend.clicked.add(onClickInvite);
            addFriend.battleFriend = visitFriend;
            addFriend.alert = alert;
            items.push(addFriend);
        }
        friendsBar.y = 690;
        friendsBar.x = 10;
        friendList.changed.add(update);
        update();
    }

    private function eduStartedHandler():void
    {
        friendsBar.eduMode = true;
    }

    private function onClickInvite(event:MouseEvent):void
    {
        inviteFriend.dispatch();
    }

    private function update():void
    {
        while (items.length <= friendList.users.length)
        {
            var addFriend:FriendItemView = new FriendItemView();
            friendsBar.addItem(addFriend);
            addFriend.clicked.add(onClickInvite);
            addFriend.battleFriend = visitFriend;
            addFriend.alert = alert;
            items.push(addFriend);
        }
        for (var i:int = 0; i < friendList.users.length-1; i++)
        {
            items[i + 1].assign(friendList.users[i+1]);
        }
    }
}
}
