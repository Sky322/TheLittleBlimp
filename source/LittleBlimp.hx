package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class Blimp extends FlxSprite{

    public var isBulkUP:Bool;
    public var isFireUP:Bool;
    private var time = 200;

    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(15,15, FlxColor.BLUE);
        drag.x = drag.y = 1200;
    }
    function isFireUpTime(){
        if (time>=0){
            time--;
        }
        else{
            isFireUP = false;
        }

    }

    function movement(){
        var spd:Float = 200;
        var up:Bool = false;
        var down:Bool = false;
        var left:Bool = false;
        var right:Bool = false;
        up = FlxG.keys.anyPressed([UP, W]);
        down = FlxG.keys.anyPressed([DOWN, S]);
        left = FlxG.keys.anyPressed([LEFT, A]);
        right = FlxG.keys.anyPressed([RIGHT, D]);

        if (up && down){
            up = down = false;
        }
        if (left && right){
            left = right = false;
        }
        if (up){
            velocity.y = -spd;
        }
        if (down){
            velocity.y = spd;
        }
        if (left){
            velocity.x = -spd;
        }
        if (right){
            velocity.x = spd;
        }
    }

    override function update(elapsed:Float) {
        if (isFireUP){
            isFireUpTime();
        }
        movement();
        super.update(elapsed);
    }
}