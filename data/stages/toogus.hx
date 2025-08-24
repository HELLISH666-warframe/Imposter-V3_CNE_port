var bgDark:FlxSprite;
var machineDark:FlxSprite;
var lightsOutSprite:FlxSprite = new FlxSprite(-700, -70).makeGraphic(10000, 10000, 0xFF000000);
var flashSprite:FlxSprite = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFFb30000);
var stageFront2Dark:FlxSprite;
var miraGradient:FlxSprite;
var lightsDownTrue = [64, 160, 272, 280, 288, 296, 298, 300, 302, 304, 368];
var lightsDownFalse = [128, 192, 276, 284, 292, 297, 299, 301, 303, 360, 400];
function create()
{
	var bg:FlxSprite = new FlxSprite(0,50).loadGraphic(Paths.image('stages/mira/Mira'));
	bg.setGraphicSize(Std.int(bg.width * 1.4));
	bg.antialiasing = true;
	bg.scrollFactor.set(1, 1);
	bg.active = false;
	insert(1,bg);
	add(bg);

	bgDark = new FlxSprite(0,50).loadGraphic(Paths.image('stages/mira/MiraDark'));
	bgDark.setGraphicSize(Std.int(bgDark.width * 1.4));
	bgDark.antialiasing = true;
	bgDark.scrollFactor.set(1, 1);
	bgDark.active = false;
	bgDark.alpha = 0;
	insert(2,bgDark);
	add(bgDark);

	var stageFront:FlxSprite = new FlxSprite(1000, 150).loadGraphic(Paths.image('stages/mira/vending_machine'));
	stageFront.updateHitbox();
	stageFront.antialiasing = true;
	stageFront.scrollFactor.set(1, 1);
	stageFront.active = false;
	insert(3,stageFront);
	add(stageFront);

	machineDark = new FlxSprite(1000, 150).loadGraphic(Paths.image('stages/mira/vending_machineDark'));
	machineDark.updateHitbox();
	machineDark.antialiasing = true;
	machineDark.scrollFactor.set(1, 1);
	machineDark.active = false;
	machineDark.alpha = 0;
	insert(4,machineDark);
	add(machineDark);

	stageFront2 = new FlxSprite(-850, 800).loadGraphic(Paths.image('stages/mira/table'));
	stageFront2.updateHitbox();
	stageFront2.antialiasing = true;
	stageFront2.scrollFactor.set(1, 1);
	stageFront2.setGraphicSize(Std.int(stageFront2.width * 1.6));

	stageFront3 = new FlxSprite(1600, 800).loadGraphic(Paths.image('stages/mira/table'));
	stageFront3.updateHitbox();
	stageFront3.antialiasing = true;
	stageFront3.scrollFactor.set(1, 1);
	stageFront3.setGraphicSize(Std.int(stageFront3.width * 1.6));
	stageFront3.flipX = true;
	insert(5,stageFront2);
	add(stageFront2);
	insert(6,stageFront3);
	add(stageFront3);

	stageFront2Dark = new FlxSprite(-850, 800).loadGraphic(Paths.image('stages/mira/tableDark'));
	stageFront2Dark.updateHitbox();
	stageFront2Dark.antialiasing = true;
	stageFront2Dark.scrollFactor.set(1, 1);
	stageFront2Dark.setGraphicSize(Std.int(stageFront2Dark.width * 1.6));
	stageFront2Dark.alpha = 0;

	stageFront3Dark = new FlxSprite(1600, 800).loadGraphic(Paths.image('stages/mira/tableDark'));
	stageFront3Dark.updateHitbox();
	stageFront3Dark.antialiasing = true;
	stageFront3Dark.scrollFactor.set(1, 1);
	stageFront3Dark.setGraphicSize(Std.int(stageFront3Dark.width * 1.6));
	stageFront3Dark.flipX = true;
	stageFront3Dark.alpha = 0;
	insert(7,stageFront2Dark);
	add(stageFront2Dark);
	insert(8,stageFront3Dark);
	add(stageFront3Dark);

	miraGradient = new FlxSprite(0,50).loadGraphic(Paths.image('stages/mira/MiraGradient'));
	miraGradient.setGraphicSize(Std.int(miraGradient.width * 1.4));
	miraGradient.antialiasing = true;
	miraGradient.scrollFactor.set(1, 1);
	miraGradient.active = false;
	miraGradient.alpha = 0;
	insert(9,miraGradient);
	add(miraGradient);
	
	lightsOutSprite.alpha = 0;
	flashSprite.scrollFactor.set(0, 0);
	insert(10,lightsOutSprite);
	add(lightsOutSprite); // lights out stuff
}

function postCreate()
{
}

function update(elapsed)
{
}
function PartialLightsOUT(id:Bool)
{
	if(id)
	{
		camGame.flash(FlxColor.BLACK, 1);
		machineDark.alpha = 1;
		bgDark.alpha = 1;
		stageFront2Dark.alpha = 1;
		stageFront3Dark.alpha = 1;
		miraGradient.alpha = 1;
	}else{
		camGame.flash(FlxColor.WHITE, 0.35);
		machineDark.alpha = 0;
		bgDark.alpha = 0;
		stageFront2Dark.alpha = 0;
		stageFront3Dark.alpha = 0;
		miraGradient.alpha = 0;
	}
}
function LightsOUT(id:Bool)
{
	if(id)
	{
		camGame.flash(FlxColor.WHITE, 0.35);
		lightsOutSprite.alpha = 1;
		gf.alpha = 0;
		stageFront2.alpha = 0;
		stageFront3.alpha = 0;
			//changeDadCharacter("whiteimpostor");
			//changeBFCharacter("bfeyes");
		healthBar.createFilledBar(FlxColor.fromString('#FF' + dad.playerColor), FlxColor.fromString('#FF' + boyfriend.playerColor));
		miraGradient.alpha = 0;
		stageFront2Dark.alpha = 0;
		stageFront3Dark.alpha = 0;		
	}else{
		camGame.flash(FlxColor.BLACK, 0.35);
		lightsOutSprite.alpha = 0;
		gf.alpha = 1;
		stageFront2.alpha = 1;
		stageFront3.alpha = 1;
		//changeDadCharacter("impostor3");
		//changeBFCharacter("bf");
		healthBar.createFilledBar(FlxColor.fromString('#FF' + dad.playerColor), FlxColor.fromString('#FF' + boyfriend.playerColor));
		miraGradient.alpha = 1;
		stageFront2Dark.alpha = 1;
		stageFront2Dark.alpha = 1;
	}
}
function beatHit(curBeat:Int) {
	if(curSong == "lights-down" && curBeat == 32) 
	{
		PartialLightsOUT(true);
	}
	if(curSong == "lights-down")
	{
		for (i in 0...lightsDownTrue.length)
		{
			if (curBeat == lightsDownTrue[i])
				LightsOUT(true);
		}
		for (i in 0...lightsDownFalse.length)
		{
			if (curBeat == lightsDownFalse[i])
				LightsOUT(false);
		}
	}
}