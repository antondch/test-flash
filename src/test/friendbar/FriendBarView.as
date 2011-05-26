package friendbar
{
import flash.display.SimpleButton;
import flash.display.Sprite;

import flash.events.MouseEvent;
import flash.
public class FriendBarView extends Sprite
{
    private var scrollPane:ScrollPane;
//    private var navigation:NavigatorContent;
//    private var scroller:Scroller;
    private var leftArrow:SimpleButton;
    private var rightArrow:SimpleButton;

    public function FriendBarView()
    {

    }

    public function draw():void
    {

//        group = new Sprite();
//        group.columnAlign = "left";
//        group.horizontalAlign = "justify";
//        group.orientation = "columns";
//        group.columnAlign = "left";
//        group.columnWidth = 80;
//        group.verticalAlign = "justify";
//        group.horizontalGap = 4;
//        group.verticalGap = 200;
//        group.percentWidth = 100;
//        group.height = 100;
//        navigation = new NavigatorContent();
//
//        scroller = new Scroller();
//        scroller.percentWidth = 100;
//        scroller.percentHeight = 100;
//        scroller.viewport = group;
//        scroller.horizontalCenter = 50;
//        scroller.setStyle("horizontalScrollPolicy", "off");
//        scroller.setStyle("verticalScrollPolicy", "off");
//
//        navigation.width = 587;
//        navigation.x = 95;
//        navigation.height = 100;
//        navigation.layout = new HorizontalLayout();
//        navigation.addElement(scroller);
//        addChild(navigation);


        leftArrow = new SimpleButton();
        leftArrow.x = 43;
        leftArrow.y = 25;
        leftArrow.addEventListener(MouseEvent.CLICK, leftArrowClickHandler);
        addChild(leftArrow);
        rightArrow = new SimpleButton();
        rightArrow.addEventListener(MouseEvent.CLICK, rightArrowClickHandler);
        rightArrow.x = 695;
        rightArrow.y = 25;

        addChild(rightArrow);
    }

    private function rightArrowClickHandler(event:MouseEvent):void
    {
        scrollPane.horizontalScrollPosition += 84;
    }

    private function leftArrowClickHandler(event:MouseEvent):void
    {
        scrollPane.horizontalScrollPosition -= 84;
    }


    public function addItem(item:FriendItemView):void
    {
        scrollPane.addElement(item);
    }

    public function insertFriend(item:FriendItemView):void
    {
        scrollPane.addElementAt(item,0);
    }

    public function set eduMode(value:Boolean):void
    {
            for(var i:int = 0;i< this.numChildren;i++)
            {
                var child:* = this.getChildAt(i);
                child.mouseEnabled = !value;
                child.mouseChildren = !value;
            }
    }

}
}
