package;

import flixel.FlxSprite;
import flixel.FlxG;

class Blast extends FlxSprite{
    private var spd = 350;
    private var life = 100;

    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(3,3);
    }

    function movement(){
        velocity.x = spd;
    }

    function die(){
        if (life <= 0){
            this.kill();
        }
        life--;
    }

    override function update(elapsed:Float) {
        movement();
        die();
        super.update(elapsed);
    }
}