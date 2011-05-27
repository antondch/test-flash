package test.preview
{

import flash.display.Shape;
import flash.display.Sprite;

public class PreviewContainerView extends Sprite
{
    private var _border:Shape;
    private var _mask:Shape;
    private var _previewSprite:Sprite;

    public function PreviewContainerView()
    {
        this.addChild(_border);
    }

    public function draw(width:int, height:int, borderThick:Number, borderColor:uint):void
    {
        _border.graphics.lineStyle(borderThick, borderColor);
        _border.graphics.drawRect(0, 0, this.width=width, this.height=height);
        _mask.graphics.beginFill(0x000000);
        _mask.graphics.drawRect(0, 0, width, height);
        _mask.graphics.endFill();
        _previewSprite.width=width;
        _previewSprite.mask=_mask;
    }



}
}
