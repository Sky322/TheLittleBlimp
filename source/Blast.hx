package;

import flixel.FlxSprite;
import flixel.FlxG;

class Blast extends FlxSprite{
    private var spd = 300;
    private var life = 100;

    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(7,5);
    }

    private function movement(){
        velocity.x = spd;
    }

    private function die(){
        if (life <= 0){
            this.kill();
        }
        life--;
    }

    public function init(X:Float,Y:Float){
        reset(0,0);
        x=X;
        y=Y;
    }

    override function update(elapsed:Float) {
        movement();
        die();
        super.update(elapsed);
    }
}