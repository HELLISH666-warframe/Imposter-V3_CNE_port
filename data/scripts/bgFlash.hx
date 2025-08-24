var flashSprite:FlxSprite = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFFb30000);
add(flashSprite);
flashSprite.alpha = 0;
flashSprite.scrollFactor.set(0, 0);
flashSprite.cameras = [camHUD];

public function bgFlash():Void
{
	//oops im stupid so commented out the tweening version
	//flashSprite.alpha = 0;
	//FlxTween.tween(flashSprite.alpha, 0.4, 0.15);
	trace('BG FLASH FUNNY');
	//yeaaah nice try buckaroo cant FLASH WHILE IN A CUTSCENE!! BITCH!!!!!!!!
	//if(!inCutscene)
		flashSprite.alpha = 0.4;
}
override function stepHit()
{
	flashSprite.alpha -= 0.08;
}