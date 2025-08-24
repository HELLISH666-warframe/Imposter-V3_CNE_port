import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
	static var initialized:Bool = false;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;
	var starFG:FlxBackdrop;
	var starBG:FlxBackdrop;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	var logoBl:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;

	function create()
	{
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);

		add(bg);

		var bg:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.scrollFactor.set();
		if(FlxG.save.data.antialiasing)
			{
				bg.antialiasing = true;
			}
		add(bg);

		starFG = new FlxBackdrop(Paths.image('menus/mainmenu/starFG'), 1, 1, true, true);
		starFG.updateHitbox();
		starFG.antialiasing = true;
		starFG.scrollFactor.set();
		add(starFG);

		starBG = new FlxBackdrop(Paths.image('menus/mainmenu/starBG'), 1, 1, true, true);
		starBG.updateHitbox();
		starBG.antialiasing = true;
		starBG.scrollFactor.set();
		add(starBG);

			logoBl = new FlxSprite(-150, -100);
			logoBl.frames = Paths.getSparrowAtlas('menus/titlescreen/logo');
		if(FlxG.save.data.antialiasing)
			{
				logoBl.antialiasing = true;
			}
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, false);
		logoBl.updateHitbox();
		logoBl.screenCenter();

		add(logoBl);

		titleText = new FlxSprite(100, FlxG.height * 0.8);
		titleText.frames = Paths.getSparrowAtlas('menus/mainmenu/startText');
		titleText.animation.addByPrefix('idle', "EnterIdle", 24, false);
		titleText.animation.addByPrefix('press', "EnterStart", 24, false);		
		if(FlxG.save.data.antialiasing)
			{
				titleText.antialiasing = true;
			}
		titleText.animation.play('idle');
		titleText.updateHitbox();
		titleText.screenCenter(FlxAxes.X);
		titleText.y -= 80;
		add(titleText);

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('logo'));
		logo.screenCenter();
		if(FlxG.save.data.antialiasing)
			{
				logo.antialiasing = true;
			}

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "ninjamuffin99\nPhantomArcade\nkawaisprite\nevilsk8er", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menus/titlescreen/newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(FlxAxes.X);
		if(FlxG.save.data.antialiasing)
			{
				ngSpr.antialiasing = true;
			}

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: FlxEase.PINGPONG});

		FlxG.mouse.visible = false;

		if (initialized)
			skipIntro();
		else {

			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
			Conductor.changeBPM(102);
			initialized = true;
		}

	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('data/introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		starFG.x -= 0.06;
		starBG.x -= 0.02;

		var pressedEnter:Bool = controls.ACCEPT;

		if (pressedEnter && !transitioning && skippedIntro)
		{

			if (FlxG.save.data.flashing)
				titleText.animation.play('press');
				titleText.offset.set(278, 2);

			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

			transitioning = true;
			// FlxG.sound.music.stop();
			FlxG.switchState(new MainMenuState());

			MainMenuState.firstStart = true;
			MainMenuState.finishedFunnyMove = false;

		if (pressedEnter && !skippedIntro && initialized)
		{
			skipIntro();
		}

	}
}

	function createCoolText(textArray:Array<String>)
	{
		for (i in 0...textArray.length)
		{
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true, false);
			money.screenCenter(FlxAxes.X);
			money.y += (i * 60) + 200;
			credGroup.add(money);
			textGroup.add(money);
		}
	}

	function addMoreText(text:String)
	{
		var coolText:Alphabet = new Alphabet(0, 0, text, true, false);
		coolText.screenCenter(FlxAxes.X);
		coolText.y += (textGroup.length * 60) + 200;
		credGroup.add(coolText);
		textGroup.add(coolText);
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	override function beatHit()
	{

		logoBl.animation.play('bump', true);
		danceLeft = !danceLeft;

		switch (curBeat)
		{
			case 0:
				deleteCoolText();
			case 1:
				createCoolText(['team funktastic']);
			case 3:
				addMoreText('presents');
			case 4:
				deleteCoolText();
			case 5:
				if (Main.watermarks)
					createCoolText(['Kade Engine', 'by']);
				else
					createCoolText(['In Partnership', 'with']);
			case 7:
				if (Main.watermarks)
					addMoreText('KadeDeveloper');
				else
				{
					addMoreText('Newgrounds');
					ngSpr.visible = true;
				}
			case 8:
				deleteCoolText();
				ngSpr.visible = false;
			case 9:
				createCoolText([curWacky[0]]);
			case 11:
				addMoreText(curWacky[1]);
			case 12:
				deleteCoolText();
			case 13:
				addMoreText('versus');
			case 14:
				addMoreText('impostor');
			case 15:
				addMoreText('version three'); // credTextShit.text += '\nFunkin';

			case 16:
				skipIntro();
		}
	}

	var skippedIntro:Bool = false;

function skipIntro():Void
{
	if (!skippedIntro)
	{
		remove(ngSpr);
		FlxG.camera.flash(FlxColor.WHITE, 4);
		remove(credGroup);

		FlxTween.tween(logoBl,{y: -100}, 1.4, {ease: FlxEase.expoInOut});

		logoBl.angle = -4;

		new FlxTimer().start(0.01, function(tmr:FlxTimer)
			{
				if(logoBl.angle == -4) 
					FlxTween.angle(logoBl, logoBl.angle, 4, 4, {ease: FlxEase.quartInOut});
				if (logoBl.angle == 4) 
					FlxTween.angle(logoBl, logoBl.angle, -4, 4, {ease: FlxEase.quartInOut});
			}, 0);
		skippedIntro = true;
	}
}