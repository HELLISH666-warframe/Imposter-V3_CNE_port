import funkin.backend.MusicBeatState;
override function create()
{	

}
function postCreate(){
	remove(blackBar);
	remove(weekBG);
	remove(characterSprites);
	remove(weekSprites);
	remove(tracklist);
	remove(leftArrow);
	remove(rightArrow);
	remove(weekTitle);
	remove(scoreText);
}
override function update(elapsed:Float) {
}