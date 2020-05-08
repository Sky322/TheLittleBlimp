package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxState;
import LittleBlimp;
import UFO;
import Ground;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
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

	private var blimp:Blimp;
	private var blast:Blast;
	private var ufo:UFO;
	private var grounds:FlxTypedGroup<Ground>;
	private var walls:FlxTypedGroup<Ground>;
	private var roofs:FlxTypedGroup<Ground>;

	override public function create():Void
	{
		blimp = new Blimp(20,20);
		add(blimp);
		FlxG.camera.follow(blimp, FlxCameraFollowStyle.PLATFORMER, 1);
		bgColor = 0xFFE97512;

		super.create();

		createUFO();
		initializeGround();
		initializeWall();
		initializeRoof();
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

	private function initializeGround() {
		grounds = new FlxTypedGroup<Ground>();

		for (i in 0...GROUND_COUNT) {
			var x:Float = GROUND_START_X + (i * Ground.WIDTH);
			var y:Float = GROUND_START_Y;
			var ground:Ground = new Ground(x, y);
			grounds.add(ground);
		}
		add(grounds);
	}
	private function initializeWall() {
		walls = new FlxTypedGroup<Ground>();

		for (i in 0...WALL_COUNT) {
			var x:Float = WALL_START_X;
			var y:Float = WALL_START_Y - (i * Ground.HEIGHT);
			var wall:Ground = new Ground(x, y);
			walls.add(wall);
		}
		add(walls);
	}
	private function initializeRoof() {
		roofs = new FlxTypedGroup<Ground>();

		for (i in 0...ROOF_COUNT) {
			var x:Float = ROOF_START_X + (i * Ground.WIDTH);
			var y:Float = ROOF_START_Y;
			var roof:Ground = new Ground(x, y);
			roofs.add(roof);
		}
		add(roofs);
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

		FlxG.collide(hero, walls);
		FlxG.collide(hero, grounds);
		FlxG.collide(hero, roofs);

		blimpShoot();
		super.update(elapsed);
	}

	private function blimpDeath(blimp:Blimp, ufo:UFO) {
		ufo.kill();
		blimp.kill();
	}
}
