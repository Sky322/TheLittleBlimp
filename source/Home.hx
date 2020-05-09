package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Home extends FlxSprite {
    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(37, 50, FlxColor.BROWN);
    }
}