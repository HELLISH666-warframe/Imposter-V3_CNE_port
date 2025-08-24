import flixel.text.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxTextBorderStyle;
//how_the_FUCK_do_i_use_contains!?!?!?!
var kadeshit:FlxText = new FlxText(20, 5, 0, PlayState.SONG.meta.displayName + " - " + PlayState.difficulty  +  " | KE 1.6",12);
for(k=>label in [kadeshit]) {
	label.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);

	label.x = 15 + (162 * k);
	label.cameras = [camHUD];

	add(label);}