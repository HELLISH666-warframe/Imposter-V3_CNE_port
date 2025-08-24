import flixel.addons.display.FlxBackdrop;
import openfl.Lib;
var speedLines:FlxBackdrop;
var speedPass:Array<Float> = [11000, 11000, 11000, 11000];
var farSpeedPass:Array<Float> = [11000, 11000, 11000, 11000, 11000, 11000, 11000];
var rightBuildings:Array<FlxSprite>;
var middleBuildings:Array<FlxSprite>;
var leftBuildings:Array<FlxSprite>;
var cloudScroll:FlxTypedGroup<FlxSprite> = [];
var farClouds:FlxTypedGroup<FlxSprite> = [];
var time:Float = 0;
function create()
{
	GameOverSubstate.deathSoundName = 'ejected_death';
	GameOverSubstate.characterName = 'bf-fall';
	GameOverSubstate.loopSoundName = 'new_Gameover';
	GameOverSubstate.endSoundName = 'gameover-New_end';
	cloudScroll = new FlxTypedGroup();
	farClouds = new FlxTypedGroup();
	var sky:FlxSprite = new FlxSprite(-2372.25, -4181.7).loadGraphic(Paths.image('stages/ejected/sky'));
	sky.antialiasing = true;
	sky.updateHitbox();
	sky.scrollFactor.set(0, 0);
	insert(1,sky);
	add(sky);

	fgCloud = new FlxSprite(-2660.4, -402).loadGraphic(Paths.image('stages/ejected/fgClouds'));
	fgCloud.antialiasing = true;
	fgCloud.updateHitbox();
	fgCloud.scrollFactor.set(0.2, 0.2);
	insert(2,fgCloud);
	add(fgCloud);

	for (i in 0...farClouds.members.length)
	{
		add(farClouds.members[i]);
	}
	insert(3,farClouds);
	add(farClouds);

	rightBuildings = [];
	leftBuildings = [];
	middleBuildings = [];
	for (i in 0...2)
	{
		var rightBuilding = new FlxSprite(1022.3, -390.45);
		rightBuilding.frames = Paths.getSparrowAtlas('stages/ejected/buildingSheet');
		rightBuilding.animation.addByPrefix('1', 'BuildingB1', 24, false);
		rightBuilding.animation.addByPrefix('2', 'BuildingB2', 24, false);
		rightBuilding.animation.play('1');
		rightBuilding.antialiasing = true;
		rightBuilding.updateHitbox();
		rightBuilding.scrollFactor.set(0.5, 0.5);
		insert(4,rightBuilding);
		add(rightBuilding);
		rightBuildings.push(rightBuilding);
	}

	for (i in 0...2)
	{
		var middleBuilding = new FlxSprite(-76.15, 1398.5);
		middleBuilding.frames = Paths.getSparrowAtlas('stages/ejected/buildingSheet');
		middleBuilding.animation.addByPrefix('1', 'BuildingA1', 24, false);
		middleBuilding.animation.addByPrefix('2', 'BuildingA2', 24, false);
		middleBuilding.animation.play('1');
		middleBuilding.antialiasing = true;
		middleBuilding.updateHitbox();
		middleBuilding.scrollFactor.set(0.5, 0.5);
		insert(5,middleBuilding);
		add(middleBuilding);
		middleBuildings.push(middleBuilding);
	}
	for (i in 0...2)
		{
			var leftBuilding = new FlxSprite(-1099.3, 7286.55);
			leftBuilding.frames = Paths.getSparrowAtlas('stages/ejected/buildingSheet');
			leftBuilding.animation.addByPrefix('1', 'BuildingB1', 24, false);
			leftBuilding.animation.addByPrefix('2', 'BuildingB2', 24, false);
			leftBuilding.animation.play('1');
			leftBuilding.antialiasing = true;
			leftBuilding.updateHitbox();
			leftBuilding.scrollFactor.set(0.5, 0.5);
			insert(6,leftBuilding);
			add(leftBuilding);
			leftBuildings.push(leftBuilding);
		}
	

	rightBuildings[0].y = 6803.1;
	middleBuildings[0].y = 8570.5;
	leftBuildings[0].y = 14050.2;

	for (i in 0...3)
	{
		// now i could add the clouds manually
		// but i wont!!! trolled
		var newCloud:FlxSprite = new FlxSprite();
		newCloud.frames = Paths.getSparrowAtlas('stages/ejected/scrollingClouds');
		newCloud.animation.addByPrefix('1', 'Cloud' + i, 24, false);
		newCloud.animation.play('1');
		newCloud.updateHitbox();
		newCloud.alpha = 1;

		switch (i)
		{
			case 0:
				newCloud.setPosition(-9.65, -224.35);
				newCloud.scrollFactor.set(0.8, 0.8);
			case 1:
				newCloud.setPosition(-1342.85, -350.45);
				newCloud.scrollFactor.set(0.6, 0.6);
			case 2:
				newCloud.setPosition(1784.65, -957.05);
				newCloud.scrollFactor.set(1.3, 1.3);
			case 3:
				newCloud.setPosition(-2217.45, -1377.65);
				newCloud.scrollFactor.set(1, 1);
		}
		insert(14,newCloud);
		cloudScroll.add(newCloud);
	}

	speedLines = new FlxBackdrop(Paths.image('stages/ejected/speedLines'), FlxAxes.XY, 0, 0);
	speedLines.antialiasing = true;
	speedLines.updateHitbox();
	speedLines.scrollFactor.set(1.3, 1.3);
	speedLines.alpha = 0.3;
	var rainbTmr = new FlxTimer().start(0.005, function(tmr:FlxTimer)
		{
			leftBuildings.x += (Math.sin(time)/5)+999;
			speedLines.x += (Math.sin(time)/5)+999;
			tmr.reset(0.005);
		});
	add(speedLines);
	add(leftBuilding);
}
function postCreate()
{
	//NEED_FOR_PARASITE_SCALING
	dad.setGraphicSize(Std.int(dad.width * 2));

}
function update(elapsed)
{				
	// make sure that the clouds exist
	if (cloudScroll.members.length == 3)
		{
			for (i in 0...cloudScroll.members.length)
			{
				cloudScroll.members[i].y = FlxMath.lerp(cloudScroll.members[i].y, cloudScroll.members[i].y - speedPass[i],
					FlxMath.bound(elapsed * 9, 0, 1));
				if (cloudScroll.members[i].y < -1789.65)
				{
					// im not using flxbackdrops so this is how we're doing things today
					var randomScale = FlxG.random.float(1.5, 2.2);
					var randomScroll = FlxG.random.float(1, 1.3);

					speedPass[i] = FlxG.random.float(1100, 1300);

					cloudScroll.members[i].scale.set(randomScale, randomScale);
					cloudScroll.members[i].scrollFactor.set(randomScroll, randomScroll);
					cloudScroll.members[i].x = FlxG.random.float(-3578.95, 3259.6);
					cloudScroll.members[i].y = 2196.15;
				}
			}
		}
	if (farClouds.members.length == 7)
		{
			for (i in 0...farClouds.members.length)
				{
				farClouds.members[i].y = FlxMath.lerp(farClouds.members[i].y, farClouds.members[i].y - farSpeedPass[i],
					FlxMath.bound(elapsed * 9, 0, 1));
				if (farClouds.members[i].y < -1614)
				{
					var randomScale = FlxG.random.float(0.2, 0.5);
					var randomScroll = FlxG.random.float(0.2, 0.4);

					farSpeedPass[i] = FlxG.random.float(1100, 1300);

					farClouds.members[i].scale.set(randomScale, randomScale);
					farClouds.members[i].scrollFactor.set(randomScroll, randomScroll);
					farClouds.members[i].x = FlxG.random.float(-2737.85, 3485.4);
					farClouds.members[i].y = 1738.6;
				}
			}
		}
	// AAAAAAAAAAAAAAAAAAAA
	if (leftBuildings.length > 0)
	{
		for (i in 0...leftBuildings.length)
		{
			leftBuildings[i].y = middleBuildings[i].y + 5888;
		}
	}
	if (middleBuildings.length > 0)
	{
		for (i in 0...middleBuildings.length)
		{
			if (middleBuildings[i].y < -11759.9)
			{
				middleBuildings[i].y = 3190.5;
				middleBuildings[i].animation.play(FlxG.random.bool(50) ? '1' : '2');
			}
			middleBuildings[i].y = FlxMath.lerp(middleBuildings[i].y, middleBuildings[i].y - 1300, FlxMath.bound(elapsed * 9, 0, 1));
		}
	}
	if (rightBuildings.length > 0)
		{
			for (i in 0...rightBuildings.length)
			{
				rightBuildings[i].y = leftBuildings[i].y;
			}
		}
	
	speedLines.y = FlxMath.lerp(speedLines.y, speedLines.y - 1350 (elapsed * 9, 0, 1));

	if (fgCloud != null)
	{
		fgCloud.y = FlxMath.lerp(fgCloud.y, fgCloud.y - 0.01, FlxMath.bound(elapsed * 9, 0, 1));
	}
}