import funkin.backend.MusicBeatState;
var txtTracklist:FlxText;

	var grpWeekText:FlxTypedGroup;

	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;

	var polusWarehouse:FlxSprite;
	var polusRocks:FlxSprite;
	var polusHills:FlxSprite;
	var polusGround:FlxSprite;

	var reactor:FlxSprite;
	var baller:FlxSprite;

	var bgSky:FlxSprite;

	//var effect:MosaicEffect;
	var effectTween:FlxTween;

	var defeatScroll:FlxSprite;

	var groundTween:FlxTween;
	var hillsTween:FlxTween;
	var rocksTween:FlxTween;
	var warehouseTween:FlxTween;
	var reactorTween:FlxTween;
	var ballerTween:FlxTween;
	var defeatTween:FlxTween;
	var yellowBG:FlxSprite = new FlxSprite(0, 56).makeGraphic(FlxG.width, 400, 0xFFF9CF51);
	
var mosaic:CustomShader  = new CustomShader("mosaic");
var mosaicStrength:Float = 1;
override function create()
{	
	var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menus/storymenu/spacep'));
	bg.scrollFactor.x = 0;
	bg.scrollFactor.y = 0.10;
	bg.setGraphicSize(Std.int(bg.width * 1.1));
	bg.updateHitbox();
	bg.screenCenter();
	add(bg);

	polusGround = new FlxSprite(-406.63, 1169.29).loadGraphic(Paths.image('menus/storymenu/polusGround'));
	polusHills = new FlxSprite(-866.63, 873.62).loadGraphic(Paths.image('menus/storymenu/polusHills'));
	polusRocks = new FlxSprite(-641.06, 712.09).loadGraphic(Paths.image('menus/storymenu/polusrocks'));
	polusWarehouse = new FlxSprite(-320.84, 1220.92).loadGraphic(Paths.image('menus/storymenu/polusWarehouse'));
	polusGround.setGraphicSize(Std.int(polusGround.width * 0.7));
	polusHills.setGraphicSize(Std.int(polusHills.width * 0.7));
	polusRocks.setGraphicSize(Std.int(polusRocks.width * 0.7));
	polusWarehouse.setGraphicSize(Std.int(polusWarehouse.width * 0.7));
	add(polusRocks);
	add(polusHills);
	add(polusWarehouse);
	add(polusGround);

	baller = new FlxSprite(-505, 100).loadGraphic(Paths.image('menus/storymenu/reactorball'));
	baller.setGraphicSize(Std.int(baller.width * 0.3));
	add(baller);

	reactor = new FlxSprite(-2300, -400).loadGraphic(Paths.image('menus/storymenu/reactorroom'));
	reactor.setGraphicSize(Std.int(reactor.width * 0.3));
	add(reactor);

	bgSky = new FlxSprite(-500, 270).loadGraphic(Paths.image('menus/storymenu/tomong'));
	bgSky.scrollFactor.set(0.1, 0.1);
	bgSky.screenCenter();
	add(bgSky);
	bgSky.setGraphicSize(Std.int(bgSky.width * 5));
	bgSky.alpha = 0;

	//effect = new MosaicEffect();
	//bgSky.shader = effect.shader;

	defeatScroll = new FlxSprite(-100, 937).loadGraphic(Paths.image('menus/storymenu/defeatScroll'));
	defeatScroll.scrollFactor.x = 0;
	defeatScroll.scrollFactor.y = 0.10;
	defeatScroll.setGraphicSize(Std.int(defeatScroll.width * 1.1));
	defeatScroll.updateHitbox();
	defeatScroll.screenCenter();
	add(defeatScroll);

	var gradient:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menus/storymenu/menuGr'));
	gradient.scrollFactor.x = 0;
	gradient.scrollFactor.y = 0.10;
	gradient.setGraphicSize(Std.int(gradient.width * 1.1));
	gradient.updateHitbox();
	gradient.screenCenter();
	add(gradient);
}
function postCreate(){
	FlxG.camera.addShader(mosaic);

	mosaic.data.uBlocksize.value = [1, 1];
	remove(blackBar);
	remove(weekBG);
	remove(characterSprites);
	//remove(weekSprites);
	remove(leftArrow);
	remove(rightArrow);
	//remove(weekTitle);
	//remove(scoreText);
	tracklist.color = 0xFFffffff;
	tracklist.font = Paths.font('vcr.ttf');

}
function onChangeWeek(event){
	if (event.change == 0) event.playMenuSFX = false;
	var val = event.value;
	FlxTween.tween(polusGround, {y: polusGround.y + 0, angle: 0}, 0.2, {ease: FlxEase.quintIn, onComplete: function(twn:FlxTween) {
		secondtween();
	}});
}
function secondtween(){
	switch(curWeek)
	{
		case 0: 
		{
			groundTween = FlxTween.tween(polusGround,{y: 169.29}, 0.5 ,{ease: FlxEase.expoOut});
			hillsTween = FlxTween.tween(polusHills,{y: -126.38}, 0.6 ,{ease: FlxEase.expoOut});
			rocksTween = FlxTween.tween(polusRocks,{y: -287.91}, 1 ,{ease: FlxEase.expoOut});
			warehouseTween = FlxTween.tween(polusWarehouse,{y: -220.92}, 0.8 ,{ease: FlxEase.expoOut});
			reactorTween = FlxTween.tween(reactor,{y: -400}, 0.6 ,{ease: FlxEase.expoIn});
			ballerTween = FlxTween.tween(baller,{y: 100}, 0.8 ,{ease: FlxEase.expoIn});
			defeatTween = FlxTween.tween(defeatScroll,{y: 937}, 3 ,{ease: FlxEase.expoOut});
			effectTween = FlxTween.num(1, 15, 0.5, {type: FlxEase.ONESHOT}, function(strength:FlxTween)
				{
					mosaic.data.uBlocksize.value = [mosaicStrength, mosaicStrength];
				});
			FlxTween.tween(bgSky, {alpha: 0}, 0.13, {ease: FlxEase.expoIn});
		}
		case 1:
		{
			if(groundTween != null)
			{
					cancelTweens();
			}
			groundTween = FlxTween.tween(polusGround,{y: 1169.29}, 0.5 ,{ease: FlxEase.expoIn});
			hillsTween = FlxTween.tween(polusHills,{y: 873.62}, 0.6 ,{ease: FlxEase.expoIn});
			rocksTween = FlxTween.tween(polusRocks,{y: 712.09}, 0.8 ,{ease: FlxEase.expoIn});
			warehouseTween = FlxTween.tween(polusWarehouse,{y: 1220.92}, 0.7 ,{ease: FlxEase.expoIn});
			reactorTween = FlxTween.tween(reactor,{y: -1400}, 0.6 ,{ease: FlxEase.expoOut});
			ballerTween = FlxTween.tween(baller,{y: -900}, 0.8 ,{ease: FlxEase.expoOut});
			defeatTween = FlxTween.tween(defeatScroll,{y: 937}, 3 ,{ease: FlxEase.expoOut});
			effectTween = FlxTween.num(1, 15, 0.5, {type: FlxEase.ONESHOT}, function(strength:FlxTween)
				{
					mosaic.data.uBlocksize.value = [1, 1];
				});
			FlxTween.tween(bgSky, {alpha: 0}, 0.13, {ease: FlxEase.expoIn});

			var currentNuts:Int = 0; // i love testicle among s!
		}
		case 2:
		{
			if(groundTween != null)
			{
					cancelTweens();
			}
			groundTween = FlxTween.tween(polusGround,{y: 1169.29}, 0.5 ,{ease: FlxEase.expoIn});
			hillsTween = FlxTween.tween(polusHills,{y: 873.62}, 0.6 ,{ease: FlxEase.expoIn});
			rocksTween = FlxTween.tween(polusRocks,{y: 712.09}, 0.8 ,{ease: FlxEase.expoIn});
			warehouseTween = FlxTween.tween(polusWarehouse,{y: 1220.92}, 0.7 ,{ease: FlxEase.expoIn});
			reactorTween = FlxTween.tween(reactor,{y: -400}, 0.6 ,{ease: FlxEase.expoIn});
			ballerTween = FlxTween.tween(baller,{y: 100}, 0.8 ,{ease: FlxEase.expoIn});
			defeatTween = FlxTween.tween(defeatScroll,{y: 937}, 3 ,{ease: FlxEase.expoOut});
			effectTween = FlxTween.num(1, 15, 0.5, {type: FlxEase.ONESHOT}, function(strength:FlxTween)
				{
					mosaic.data.uBlocksize.value = [strength, strength];
				});
			FlxTween.tween(bgSky, {alpha: 1}, 0.4, {ease: FlxEase.expoOut});	
		}
		case 3:
		{
			if(groundTween != null)
			{
					cancelTweens();
			}
			hillsTween = FlxTween.tween(polusHills,{y: 873.62}, 0.6 ,{ease: FlxEase.expoIn});
			rocksTween = FlxTween.tween(polusRocks,{y: 712.09}, 0.8 ,{ease: FlxEase.expoIn});
			warehouseTween = FlxTween.tween(polusWarehouse,{y: 1220.92}, 0.7 ,{ease: FlxEase.expoIn});
			reactorTween = FlxTween.tween(reactor,{y: -400}, 0.6 ,{ease: FlxEase.expoIn});
			ballerTween = FlxTween.tween(baller,{y: 100}, 0.8 ,{ease: FlxEase.expoIn});
			defeatTween = FlxTween.tween(defeatScroll,{y: -2050}, 3 ,{ease: FlxEase.expoOut});
			effectTween = FlxTween.num(1, 15, 0.5, {type: FlxEase.ONESHOT}, function(strength:FlxTween)
				{
					mosaic.data.uBlocksize.value = [1, 1];
				});
			FlxTween.tween(bgSky, {alpha: 0}, 0.4, {ease: FlxEase.expoIn});
		}
	}

}
override function update(elapsed:Float) {
}
override function cancelTweens()
{
	groundTween.cancel();
	hillsTween.cancel();
	rocksTween.cancel();
	warehouseTween.cancel();
	reactorTween.cancel();
	ballerTween.cancel();
	defeatTween.cancel();
}	