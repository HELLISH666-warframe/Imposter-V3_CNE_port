importScript("data/scripts/bgFlash");
var camxoffset:Float = 70; //-100
var camyoffset:Float = 0;
var camyoffsetnorm:Float = -200;
function beatHit(curBeat:Int) {
	if (curBeat >= 128 && curBeat < 191 && camZooming && FlxG.camera.zoom < 1.35)
	{
		FlxG.camera.zoom += 0.025;
		camHUD.zoom += 0.03;
	}
	//drop 2
	if (curBeat >= 319 && curBeat < 383 && camZooming && FlxG.camera.zoom < 1.35)
	{
		FlxG.camera.zoom += 0.025;
		camHUD.zoom += 0.03;
	}
	if (curBeat >= 480 && curBeat < 607 && camZooming && FlxG.camera.zoom < 1.35)
	{
		FlxG.camera.zoom += 0.035;
		camHUD.zoom += 0.03;
	}
		//drop 1
		if (curBeat == 128)
    {
			defaultCamZoom = 0.7;

			dad.cameraOffset = FlxPoint.weak(camxoffset, camyoffset);
    }

		if (curBeat == 191)
    {
			defaultCamZoom = 0.5;
			dad.cameraOffset = FlxPoint.weak(camxoffset, camyoffsetnorm);
			camFollow.setPosition(gf.getGraphicMidpoint().x, gf.getGraphicMidpoint().y - 100);
    }
	//drop 2
		if (curBeat == 319)
    {
			defaultCamZoom = 0.7;

			dad.cameraOffset = FlxPoint.weak(camxoffset, camyoffset);
			camFollow.setPosition(gf.getGraphicMidpoint().x, gf.getGraphicMidpoint().y + 100);
    }

		if (curBeat == 383)
    {
			defaultCamZoom = 0.5;
			dad.cameraOffset = FlxPoint.weak(camxoffset, camyoffsetnorm);
			camFollow.setPosition(gf.getGraphicMidpoint().x, gf.getGraphicMidpoint().y - 100);
    }
	//FUCKING EPIC DROP NIGGA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//clowfoe wrote this btw im not racist
		if (curBeat == 480)
    {
			defaultCamZoom = 0.9;

			dad.cameraOffset = FlxPoint.weak(camxoffset, camyoffset);
			camFollow.setPosition(gf.getGraphicMidpoint().x, gf.getGraphicMidpoint().y + 100);
    }

		if (curBeat == 607)
    {
			defaultCamZoom = 0.7;
			
			dad.cameraOffset = FlxPoint.weak(camxoffset, camyoffset);
			camFollow.setPosition(gf.getGraphicMidpoint().x, gf.getGraphicMidpoint().y + 100);
    }
	switch (curBeat)
	{
		case 1 | 16 | 32 | 48 | 64 | 72 | 80 | 88 | 96 | 104 | 112 | 120 | 126 | 127 | 128 | 132 | 136 | 140 | 144 | 148 | 152 | 156 | 160 | 164 | 168 | 172 | 176 | 180 | 184 | 188 | 448 | 456 | 464 | 472 | 476 | 478 | 480 | 484 | 488 | 492 | 496 | 500 | 504 | 508 | 512 | 516 | 520 | 524 | 528 | 532 | 536 | 540 | 544 | 548 | 552 | 556 | 560 | 564 | 568 | 572 | 576 | 580 | 584 | 588 | 592 | 596 | 600 | 604 :
			bgFlash();
	}
}