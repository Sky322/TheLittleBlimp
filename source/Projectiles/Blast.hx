package;

class Blast extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(7,7);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}