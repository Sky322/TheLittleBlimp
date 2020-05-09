package;

import flixel.FlxSprite;

class DiveUFO extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(12,12);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}