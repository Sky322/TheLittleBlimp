package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.text.FlxText;

 class GameOverState extends FlxState{  
    override public function create():Void
    {
        super.create();
        add(new FlxText(150,200,0,"Game Over", 48));
        add(new FlxButton(250,300, "Replay", click));
    }

    private function click():Void{
        FlxG.switchState(new PlayState());
    }
}