package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxState;
import LittleBlimp;
import UFO;
import Ground;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	private static var BULKUP_COUNT(default, never) = 10;
	private static var BULKUP_SPAWN_BORDER(default, never) = 6400;

	private static var GROUND_COUNT(default, never) = 300;
	private static var GROUND_START_X(default, never) = 0;
	private static var GROUND_START_Y(default, never) = 350;

	private static var WALL_COUNT(default, never) = 20;
	private static var WALL_START_X(default, never) = 0;
	private static var WALL_START_Y(default, never) = 350;

	private static var ROOF_COUNT(default, never) = 300;
	private static var ROOF_START_X(default, never) = 0;
	private static var ROOF_START_Y(default, never) = -290;

	private static var UFO_COUNT(default, never) = 100;
	private static var UFO_SPAWN_BORDER(default, never) = 6400;
	private var ufos:FlxTypedGroup<UFO>;

	private var bulkUPs:FlxTypedGroup<BulkUP>;
	private var fireUPs:FlxTypedGroup<FireUP>;
	private var blimp:Blimp;
	private var blast:Blast;
	private var blast2:Blast;
	private var ufo:UFO;
	private var grounds:FlxTypedGroup<Ground>;
	private var walls:FlxTypedGroup<Ground>;
	private var roofs:FlxTypedGroup<Ground>;

	override public function create():Void
	{
		//only way I found I could get all my collisions to work
		FlxG.worldBounds.set(0,0,0,0);

		blimp = new Blimp(50,50);
		add(blimp);
		FlxG.camera.follow(blimp, FlxCameraFollowStyle.PLATFORMER, 1);
		bgColor = 0xFFE97512;

		super.create();

		createUFO();
		createPowerUPS();
		initializeGround();
		add(grounds);
	}

	private function createUFO() {
		ufos = new FlxTypedGroup<UFO>();

		for (i in 0...UFO_COUNT) {
			var x:Float = FlxG.random.int(UFO_SPAWN_BORDER, 
				FlxG.width - 100);
			var y:Float = FlxG.random.int(-200, 
				FlxG.height - 150);
			var ufo = new UFO(x, y);
			ufos.add(ufo);
		}
		add(ufos);
	}
	private function createPowerUPS() {
		bulkUPs = new FlxTypedGroup<BulkUP>();
		fireUPs = new FlxTypedGroup<FireUP>();

		for (i in 0...BULKUP_COUNT) {
			var x:Float = FlxG.random.int(BULKUP_SPAWN_BORDER, 
				FlxG.width - 100);
			var y:Float = FlxG.random.int(-200, 
				FlxG.height - 150);
			var bulkUP = new BulkUP(x, y);
			bulkUPs.add(bulkUP);
		}
		for (i in 0...BULKUP_COUNT) {
			var x:Float = FlxG.random.int(BULKUP_SPAWN_BORDER, 
				FlxG.width - 100);
			var y:Float = FlxG.random.int(-200, 
				FlxG.height - 150);
			var fireUP = new FireUP(x, y);
			fireUPs.add(fireUP);
		}
		add(fireUPs);
		add(bulkUPs);
	}

	private function initializeGround() {
		grounds = new FlxTypedGroup<Ground>();

		for (i in 0...GROUND_COUNT) {
			grounds.add(new Ground(GROUND_START_X + i * Ground.WIDTH, GROUND_START_Y));
		}
		for (i in 0...WALL_COUNT) {
			grounds.add(new Ground(WALL_START_X, WALL_START_Y - i * Ground.HEIGHT));
		}
		for (i in 0...ROOF_COUNT) {
			grounds.add(new Ground(ROOF_START_X + i * Ground.WIDTH, ROOF_START_Y));
		}
	}

	private function blimpShoot(){
		blast = new Blast(blimp.x,blimp.y);
		blast2 = new Blast(blimp.x, blimp.y+blimp.height);

        var shoot:Bool = false;
        shoot = FlxG.mouse.justPressed;
        if (shoot && blimp.isFireUP){
		   add(blast);
		   add(blast2);
		}
		else if (shoot && !blimp.isFireUP) {
			add(blast);
		}
	}

	private function blimpDeath(blimp:Blimp, ufo:UFO) {
		if (blimp.isBulkUP){
			ufo.kill();
			blimp.isBulkUP = false;
		}
		else{
			ufo.kill();
			blimp.kill();
		}
	}
	private function ufoDeath(ufo:UFO, blast:Blast) {
		ufo.kill();
		blast.kill();
	}
	private function bulkUPCollide(blimp:Blimp, bulkUP:BulkUP){
		bulkUP.kill();
		blimp.isBulkUP = true;
	}
	private function fireUPCollide(blimp:Blimp, fireUP:FireUP){
		fireUP.kill();
		blimp.isFireUP = true;
	}
	
	override public function update(elapsed:Float):Void
	{
		FlxG.collide(blimp, grounds);

		FlxG.overlap(blimp, ufos, blimpDeath);
		FlxG.overlap(ufos ,blast, ufoDeath);
		FlxG.overlap(blimp, bulkUPs, bulkUPCollide);
		FlxG.overlap(blimp, fireUPs, fireUPCollide);

		blimpShoot();

		super.update(elapsed);

	}
}