importScript("data/scripts/bgFlash");
var _cb = 0;
var _b = 0;
var saboBeats = [16, 24, 32, 40, 48, 56, 62, 63, 272, 280, 288, 296, 302, 303, 376, 384, 892];
function create()
{

}

function beatHit(curBeat:Int) {
	while(_b < saboBeats.length) {
		var sabflash = saboBeats[_b];
			++_b;
			if(curBeat == sabflash)
			{
				bgFlash();
			}
		}
		if(curBeat == 63 || curBeat == 304)
			_cb = 3;
		if(curBeat > 64 && curBeat < 124 || curBeat > 304 && curBeat < 370 || curBeat == 64 || curBeat == 124 || curBeat == 304 || curBeat == 370)
		{
			_cb++;
			if(_cb == 4)
			{
				bgFlash();
				_cb = 0;
			}
		}
}

function update(elapsed)
{
}
function endSabotage():Void{
	camHUD.visible = false;
	inCutscene = true;
	startedCountdown = false;
	generatedMusic = false;
	canPause = false;
	camZooming = false;

	trace('we got past the initial stuff');
	
	FlxG.sound.music.volume = 0;
	vocals.volume = 0;

	trace('change volume');

	camFollow.setPosition(gf.getGraphicMidpoint().x, dad.getGraphicMidpoint().y - 150);	
	dad.changeHoldState(true);
	boyfriend.changeHoldState(true);
	dad.playAnim('kill');
	boyfriend.playAnim('kill');
	FlxG.sound.play(Paths.sound('fire', 'impostor'));

	new FlxTimer().start(2.19, function(tmr:FlxTimer)
	{
			FlxTween.tween(FlxG.camera, {zoom: 0.95}, 0.5, {ease: FlxEase.circOut});
	});

	new FlxTimer().start(2.9, function(shot:FlxTimer)
	{
		FlxTween.tween(FlxG.camera, {zoom: 1}, 0.5, {ease: FlxEase.circOut});
	});

	new FlxTimer().start(5, function(trans:FlxTimer)
	{
		endSong();
	});
}