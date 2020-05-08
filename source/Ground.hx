package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Ground extends FlxSprite {
    public static var WIDTH(default, never) = 32;
    public static var HEIGHT(default, never) = 32;
    
    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, FlxColor.BLACK);

        immovable = true;
    }
}
