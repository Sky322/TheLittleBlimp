package;

class MotherShip extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(61,61);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}