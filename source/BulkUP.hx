package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class BulkUP extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(4,4, FlxColor.RED);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}