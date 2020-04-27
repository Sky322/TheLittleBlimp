package;

import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxState;
import LittleBlimp;

class PlayState extends FlxState
{
	private var blimp:Blimp;
	private var blast:Blast;

	override public function create():Void
	{
		FlxG.camera.follow(blimp);
		super.create();
		blimp = new Blimp(20,20);
		add(blimp);
	}

	function blimpShoot(){
		blast = new Blast(blimp.x,blimp.y);

        var shoot:Bool = false;
        shoot = FlxG.mouse.justPressed;
        if (shoot){
           add(blast);
        }
	}
	override public function update(elapsed:Float)
	{
		blimpShoot();
		super.update(elapsed);
	}
}
