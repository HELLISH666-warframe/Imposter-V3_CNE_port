var showOnlyStrums:Bool = false;
public var thenumber:Int = 0;
function create()
{
	var defeat:FlxSprite = new FlxSprite(0, 100).loadGraphic(Paths.image('stages/defeat/defeatfnf'));		
	defeat.setGraphicSize(Std.int(defeat.width * 2));
	defeat.scrollFactor.set(1,1);
	defeat.antialiasing = true;
	insert(1,defeat);
	add(defeat);

}
function onSongStart() {
	for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 300, angle: playerStrums.members[i].angle}, 1,  {ease: FlxEase.linear});
	for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 1250, angle: cpuStrums.members[i].angle + 359}, 1, {ease: FlxEase.linear});
}
function postCreate()
{
	missesTxt.text=missesTxt.text+"fuck";
}
function update(elapsed)
{
	if (showOnlyStrums)
	{
		healthBarBG.visible = false;
	//	kadeEngineWatermark.visible = false;
		healthBar.visible = false;
		iconP1.visible = false;
		iconP2.visible = false;
		accuracyTxt.visible = false;
		scoreTxt.visible = false;
	}
}
function onPlayerMiss(event) {
    var totalMisses:Int = misses + event.misses;

    if (totalMisses >= thenumber)  health = 0;
}
function onSongStart() {
	showOnlyStrums = true;
}
function postUpdate(elapsed:Float) {
	missesTxt.text="Don't miss";
}