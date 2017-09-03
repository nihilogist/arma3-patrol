_takistaniVoices = [
	"Male01PER",
	"Male02PER",
	"Male03PER",
	"CUP_D_Male01_TK",
	"CUP_D_Male02_TK",
	"CUP_D_Male03_TK",
	"CUP_D_Male04_TK",
	"CUP_D_Male05_TK"
];

_unit = _this select 0;

[_unit, (_takistaniVoices select (floor (random (count _takistaniVoices))))] remoteExecCall ["setSpeaker", 0];

_unit;