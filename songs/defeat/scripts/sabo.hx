function onSongStart() {
	for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 300, angle: playerStrums.members[i].angle}, 1,  {ease: FlxEase.linear});
	for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 1250, angle: cpuStrums.members[i].angle + 359}, 1, {ease: FlxEase.linear});
}