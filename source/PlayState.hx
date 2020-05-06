package;

import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxState;
import LittleBlimp;
import UFO;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	private static var UFO_COUNT(default, never) = 50;
	private static var UFO_SPAWN_BORDER(default, never) = 2000;
	private var ufos:FlxTypedGroup<UFO>;

	private var blimp:Blimp;
	private var blast:Blast;
	private var ufo:UFO;

	override public function create():Void
	{
		FlxG.camera.follow(blimp);
		super.create();
		blimp = new Blimp(20,20);
		add(blimp);

		createUFO();
	}

	private function createUFO() {
		ufos = new FlxTypedGroup<UFO>();

		for (i in 0...UFO_COUNT) {
			var x:Float = FlxG.random.int(UFO_SPAWN_BORDER, 
				FlxG.width - UFO_SPAWN_BORDER);
			var y:Float = FlxG.random.int(20, 
				FlxG.height - 20);
			var ufo = new UFO(x, y);
			ufos.add(ufo);
		}
		add(ufos);
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

		FlxG.overlap(blimp, ufos, blimpDeath);

		blimpShoot();
		super.update(elapsed);
	}

	private function blimpDeath(blimp:Blimp, ufo:UFO) {
		ufo.kill();
		blimp.kill();
	}
}
