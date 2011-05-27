package test.preview
{

import flash.display.Loader;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;

public class FriendItemThumbView extends Sprite
{
    private var _loader:Loader;
    private var _border:Shape;
    private var _picSprite:Sprite;
    private var _borderThick:Number;

    public function FriendItemThumbView()
    {
        _loader = new Loader();
        _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        _border = new Shape();
        _picSprite = new Sprite();
        this.addChild(_loader);
        this.addChild(_border);
    }

    public function draw(width:int, heigth:int, borderThick:Number, borderColor:uint, url:String):void
    {
        _border.graphics.lineStyle(this._borderThick = borderThick, borderColor);
        _border.graphics.drawRect(0, 0, this.width = width, this.height = heigth);
        if (url)
        {
            _loader.load(new URLRequest(url));
        } else
        {
            //todo: вставить надпись "нет аватара"
            trace('FriendItemThumbView.draw, avatar url not avaible');
        }
    }

    private function completeHandler(event:Event):void
    {
        _loader.removeEventListener(Event.COMPLETE, completeHandler);
        _picSprite.addChild(_loader);
        scalePic();
    }

    private function scalePic():void
    {
        var max:Number;
        (this.width < this.height) ? max = width : max = height;
        max -= _borderThick * 2;

        if (_loader.contentLoaderInfo.width <= _loader.contentLoaderInfo.height)
        {
            _picSprite.scaleY = _picSprite.scaleX = max / (_loader.contentLoaderInfo.width);
        } else
        {
            _picSprite.scaleY = _picSprite.scaleX = max / (_loader.contentLoaderInfo.height);
        }
        _picSprite.x = (this.width - _picSprite.width) / 2;
        _picSprite.y = (this.height - _picSprite.height) / 2;
    }

}
}
