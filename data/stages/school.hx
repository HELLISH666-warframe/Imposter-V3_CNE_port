var bgDark:FlxSprite;
var machineDark:FlxSprite;
var stageFront2Dark:FlxSprite;
var miraGradient:FlxSprite;
public var daPixelZoom:Float = 6;
function create()
{

	var bgSky = new FlxSprite().loadGraphic(Paths.image('stages/Tomongus/weebSky'));
	bgSky.scrollFactor.set(0, 0);
	insert(1,bgSky);
	add(bgSky);

	var repositionShit = -200;

	var bgStreet:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.image('stages/Tomongus/weebStreet'));
	bgStreet.scrollFactor.set(0.95, 0.95);
	insert(2,bgStreet);
	add(bgStreet);

	var widShit = Std.int(bgSky.width * 6);

	bgSky.setGraphicSize(widShit);
	bgStreet.setGraphicSize(widShit);

	bgSky.updateHitbox();
	bgStreet.updateHitbox();

}

function postCreate()
{
	dad.setGraphicSize(Std.int(dad.width * 6));

	gf.setGraphicSize(Std.int(gf.width * daPixelZoom));

	if(boyfriend.curCharacter == 'bf-sus'){
		boyfriend.setGraphicSize(Std.int(boyfriend.width * 6));

		boyfriend.width -= 100;
		boyfriend.height -= 100;
	}
}

function update(elapsed)
{
}