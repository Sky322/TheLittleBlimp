package;

import flixel.FlxSprite;

class FireUP extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(6,6);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}