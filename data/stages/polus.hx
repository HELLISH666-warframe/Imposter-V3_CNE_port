var crowd:FlxSprite;
var lightsOutSprite:FlxSprite = new FlxSprite(-700, -70).makeGraphic(10000, 10000, 0xFF000000);
function create()
{
	var sky:FlxSprite = new FlxSprite(-834.3, -620.5).loadGraphic(Paths.image('stages/polus/polusSky'));
	sky.antialiasing = true;
	sky.scrollFactor.set(0.5, 0.5);
	sky.active = false;
	insert(1,sky);
	add(sky);	
			
	var rocks:FlxSprite = new FlxSprite(-915.8, -411.3).loadGraphic(Paths.image('stages/polus/polusrocks'));
	rocks.updateHitbox();
	rocks.antialiasing = true;
	rocks.scrollFactor.set(0.6, 0.6);
	rocks.active = false;
	insert(2,rocks);
	add(rocks);	
							
	var hills:FlxSprite = new FlxSprite(-1238.05, -180.55).loadGraphic(Paths.image('stages/polus/polusHills'));
	hills.updateHitbox();
	hills.antialiasing = true;
	hills.scrollFactor.set(0.9, 0.9);
	hills.active = false;
	insert(3,hills);
	add(hills);

	var warehouse:FlxSprite = new FlxSprite(-458.35, -315.6).loadGraphic(Paths.image('stages/polus/polusWarehouse'));
	warehouse.updateHitbox();
	warehouse.antialiasing = true;
	warehouse.scrollFactor.set(0.9, 0.9);
	warehouse.active = false;
	insert(4,warehouse);
	add(warehouse);

	crowd = new FlxSprite(280.5, 240.8);
	crowd.frames = Paths.getSparrowAtlas('stages/polus/CrowdBop');
	crowd.animation.addByPrefix('CrowdBop', 'CrowdBop', 24);
	crowd.animation.play('CrowdBop');
	crowd.scrollFactor.set(1, 1);
	crowd.antialiasing = true;
	crowd.updateHitbox();
	crowd.scale.set(1.5, 1.5);
							
	var ground:FlxSprite = new FlxSprite(-580.9, 241.85).loadGraphic(Paths.image('stages/polus/polusGround'));
	ground.updateHitbox();
	ground.antialiasing = true;
	ground.scrollFactor.set(1, 1);
	ground.active = false;
	insert(5,ground);
	add(ground);

	deadBF = new FlxSprite(532.95, 465.95).loadGraphic(Paths.image('stages/polus/bfdead'));
	deadBF.antialiasing = true;
	deadBF.scrollFactor.set(1, 1);
	deadBF.updateHitbox();	
}

function postCreate()
{
	dad.setPosition(-169.55, 264.9);
	gf.setPosition(206, -106.7);
	boyfriend.setPosition(751.7, -20);
	//boyfriend.setPosition(751.7, 117.55)
	if(curSong.toLowerCase() == 'meltdown' || curSong.toLowerCase() == 'sabotage') {
		gf.y -= 100;
	}
	if (curSong.toLowerCase() == 'meltdown') {
		insert(5,crowd);
		add(crowd);
	}
}

function update(elapsed)
{
}
function beatHit(curBeat:Int) {
	if(curSong.toLowerCase() == 'meltdown' && curBeat % 4 == 0) {
		crowd.animation.play('CrowdBop', true);
	}
}