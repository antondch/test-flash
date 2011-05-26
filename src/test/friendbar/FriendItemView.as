package friendbar
{
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.net.*;

public class FriendItemView extends Sprite
{
    public var battleFriend:BattleFriendClicked;
    private var space:Sprite;
    private var frame:Shape;
    private var maskSprite:Sprite;
    private var picBitMap:Bitmap;
    private var _clicked:NativeSignal;
    private var _item:FriendItem;

    public function FriendItemView()
    {
        _clicked = new NativeSignal(this, MouseEvent.CLICK, MouseEvent);
//        var addFriendArt:AddFriendSimbol = new AddFriendSimbol();
//        addChild(addFriendArt);
        picBitMap = new Bitmap();
        this.buttonMode = true;
        this.mouseChildren = false;
        this.useHandCursor = true;
        addChildAt(picBitMap, 0);
//        space = addFriendArt.getChildAt(0) as Sprite;
//        frame = addFriendArt.getChildAt(1) as Shape;
        addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);

        maskSprite = new Sprite();
        maskSprite.graphics.beginFill(0xFF0000, 0);
        maskSprite.graphics.drawRoundRect(0, 0, 78, 78, 14);
        addChild(maskSprite);
    }


    public function get clicked():NativeSignal
    {
        return _clicked;
    }

    public function get item():FriendItem
    {
        return _item;
    }

    private function onMouseOver(event:MouseEvent):void
    {
        transform.colorTransform = new ColorTransform(1, 1, 1, 1, 30, 30, 30, 0);
    }

    private function onMouseOut(event:MouseEvent):void
    {
        transform.colorTransform = new ColorTransform();
    }

    public function assign(friendItem:FriendItem):void
    {
        space.alpha = 0;
        _item = friendItem;
        clicked.removeAll();
        clicked.add(battle);
        if (_item.pic)
        {
            var loader:Loader = new Loader();
            var request:URLRequest = new URLRequest(_item.pic);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            loader.load(request);
        }   else
        {
            picBitMap.addChild(new NoAvatarGrf());
        }
    }


    private function scalePic(loader:Loader):void
    {
        if (loader.contentLoaderInfo.width <= loader.contentLoaderInfo.height)
        {

            picBitMap.scaleY = picBitMap.scaleX = 78 / (loader.contentLoaderInfo.width);
        } else
        {
            picBitMap.scaleY = picBitMap.scaleX = 78 / (loader.contentLoaderInfo.height);
        }
    }

    private function battle(event:MouseEvent):void
    {
        battleFriend.dispatch(_item);
    }

    private function completeHandler(event:Event):void
    {
        var loader:Loader = Loader(event.target.loader);
        picBitMap.addChild(loader);
        picBitMap.mask = maskSprite;
        scalePic(loader);
    }
}
}
