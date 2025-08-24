importScript("data/scripts/bgFlash");
var _cb = 0;
var _b = 0;
var sussusBeats = [94, 95, 288, 296, 304, 312, 318, 319];
function create()
{

}

function beatHit(curBeat:Int) {
	if(curBeat == 97 || curBeat == 192 || curBeat == 320)
		_cb = 1;
		if(curBeat > 98 && curBeat < 160 || curBeat > 192 && curBeat < 224 || curBeat > 320 && curBeat < 382 || curBeat == 98 || curBeat == 160 || curBeat == 192 || curBeat == 224 || curBeat == 320 || curBeat == 382)
		{
			_cb++;
			if(_cb == 2)
			{
				bgFlash();
				_cb = 0;
			}
		}
		while(_b < sussusBeats.length) {
			var susflash = sussusBeats[_b];
				++_b;
				if(curBeat == susflash)
				{
					bgFlash();
				}
			}
}

function update(elapsed)
{
}