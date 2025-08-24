var bgDark:FlxSprite;
var machineDark:FlxSprite;
var lightsOutSprite:FlxSprite = new FlxSprite(-700, -70).makeGraphic(10000, 10000, 0xFF000000);
var ass2:FlxSprite;
var orb:FlxSprite = new FlxSprite();
var camxoffset:Float = 70; //-100
var camyoffset:Float = -200;
function create()
{
	var bg:FlxSprite = new FlxSprite(-2300,-1700).loadGraphic(Paths.image('stages/reactor/reactor background'));
	bg.setGraphicSize(Std.int(bg.width * 0.7));
	bg.antialiasing = true;
	bg.scrollFactor.set(1, 1);
	bg.active = false;
	insert(1,bg);
	add(bg);

	yellow = new FlxSprite(-400, 150);
	yellow.frames = Paths.getSparrowAtlas('stages/reactor/susBoppers');
	yellow.animation.addByPrefix('bop', 'yellow sus', 24, false);
	yellow.animation.play('bop');
	yellow.setGraphicSize(Std.int(yellow.width * 0.7));
	yellow.antialiasing = true;
	yellow.scrollFactor.set(1, 1);
	yellow.active = true;
	insert(2,yellow);
	add(yellow);

	var pillar1:FlxSprite = new FlxSprite(-2300,-1700).loadGraphic(Paths.image('stages/reactor/back pillars'));
	pillar1.setGraphicSize(Std.int(pillar1.width * 0.7));
	pillar1.antialiasing = true;
	pillar1.scrollFactor.set(1, 1);
	pillar1.active = false;
	insert(3,pillar1);
	add(pillar1);
	
	dripster = new FlxSprite(1375, 150);
	dripster.frames = Paths.getSparrowAtlas('stages/reactor/susBoppers');
	dripster.animation.addByPrefix('bop', 'blue sus', 24, false);
	dripster.animation.play('bop');
	dripster.setGraphicSize(Std.int(dripster.width * 0.7));
	dripster.antialiasing = true;
	dripster.scrollFactor.set(1, 1);
	dripster.active = true;
	insert(4,dripster);
	add(dripster);

	var pillar2:FlxSprite = new FlxSprite(-2300,-1700).loadGraphic(Paths.image('stages/reactor/middle pillars'));
	pillar2.setGraphicSize(Std.int(pillar2.width * 0.7));
	pillar2.antialiasing = true;
	pillar2.scrollFactor.set(1, 1);
	pillar2.active = false;
	insert(5,pillar2);
	add(pillar2);

	amogus = new FlxSprite(1670, 250);
	amogus.frames = Paths.getSparrowAtlas('stages/reactor/susBoppers');
	amogus.animation.addByPrefix('bop', 'white sus', 24, false);
	amogus.animation.play('bop');
	amogus.setGraphicSize(Std.int(amogus.width * 0.7));
	amogus.antialiasing = true;
	amogus.scrollFactor.set(1, 1);
	amogus.active = true;
	insert(6,amogus);
	add(amogus);

	brown = new FlxSprite(-850, 190);
	brown.frames = Paths.getSparrowAtlas('stages/reactor/susBoppers');
	brown.animation.addByPrefix('bop', 'brown sus', 24, false);
	brown.animation.play('bop');
	brown.setGraphicSize(Std.int(brown.width * 0.7));
	brown.antialiasing = true;
	brown.scrollFactor.set(1, 1);
	brown.active = true;
	insert(7,brown);
	add(brown);

	var pillar3:FlxSprite = new FlxSprite(-2300,-1700).loadGraphic(Paths.image('stages/reactor/front pillars'));
	pillar3.setGraphicSize(Std.int(pillar3.width * 0.7));
	pillar3.antialiasing = true;
	pillar3.scrollFactor.set(1, 1);
	pillar3.active = false;
	insert(8,pillar3);
	add(pillar3);

	orb = new FlxSprite(-460,-1300).loadGraphic(Paths.image('stages/reactor/ball of big ol energy'));
	orb.setGraphicSize(Std.int(orb.width * 0.7));
	orb.antialiasing = true;
	orb.scrollFactor.set(1, 1);
	orb.active = false;
	insert(9,orb);
	add(orb);

	var cranes:FlxSprite = new FlxSprite(-735, -1500).loadGraphic(Paths.image('stages/reactor/upper cranes'));
	cranes.setGraphicSize(Std.int(cranes.width * 0.7));
	cranes.antialiasing = true;
	cranes.scrollFactor.set(1, 1);
	cranes.active = false;
	insert(10,cranes);
	add(cranes);

	var console1:FlxSprite = new FlxSprite(-260,150).loadGraphic(Paths.image('stages/reactor/center console'));
	console1.setGraphicSize(Std.int(console1.width * 0.7));
	console1.antialiasing = true;
	console1.scrollFactor.set(1, 1);
	console1.active = false;
	insert(11,console1);
	add(console1);

	var console2:FlxSprite = new FlxSprite(-1380,450).loadGraphic(Paths.image('stages/reactor/side console'));
	console2.setGraphicSize(Std.int(console2.width * 0.7));
	console2.antialiasing = true;
	console2.scrollFactor.set(1, 1);
	console2.active = false;
	insert(12,console2);
	add(console2);

	ass2 = new FlxSprite(0, FlxG.height * 1).loadGraphic(Paths.image('vignette')); 
	ass2.scrollFactor.set();
	ass2.screenCenter();
	ass2.cameras = [camHUD];
	add(ass2);
}

function postCreate()
{
	gf.x -= 100;
	camFollow.setPosition(gf.getGraphicMidpoint().x, gf.getGraphicMidpoint().y - 100);
	dad.cameraOffset = FlxPoint.weak(camxoffset, camyoffset);
}
function beatHit(curBeat:Int) {
	if(curBeat % 4 == 0) {
		amogus.animation.play('bop', true);
		dripster.animation.play('bop', true);
		yellow.animation.play('bop', true);
		brown.animation.play('bop', true);
	}
	if (curBeat % 4 == 0)
	{
		orb.scale.set(0.75, 0.75);
		ass2.alpha = 0.9;
		orb.alpha = 1;
	}
}
function update(elapsed)
{
	if(orb != null) {
		orb.scale.x = FlxMath.lerp(0.7, orb.scale.x, 0.90);
		orb.scale.y = FlxMath.lerp(0.7, orb.scale.y, 0.90);
		orb.alpha = FlxMath.lerp(0.96, orb.alpha, 0.90);
		ass2.alpha = FlxMath.lerp(1, ass2.alpha, 0.90);
	}
}