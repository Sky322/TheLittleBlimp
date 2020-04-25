package;

import lime.utils.BytePointer;
import flixel.FlxState;
import LittleBlimp;

class PlayState extends FlxState
{

	private var blimp:Blimp;

	override public function create():Void
	{
		super.create();
		blimp = new Blimp(20,20);
		add(blimp);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
