// Setup the possible sets of civilian clothes:
_civilianUniforms = [
	"CUP_O_TKI_Khet_Partug_01",
	"CUP_O_TKI_Khet_Partug_02",
	"CUP_O_TKI_Khet_Partug_03",
	"CUP_O_TKI_Khet_Partug_04",
	"CUP_O_TKI_Khet_Partug_05",
	"CUP_O_TKI_Khet_Partug_06",
	"CUP_O_TKI_Khet_Partug_07",
	"CUP_O_TKI_Khet_Partug_08",
	"CUP_O_TKI_Khet_Jeans_01",
	"CUP_O_TKI_Khet_Jeans_02",
	"CUP_O_TKI_Khet_Jeans_03",
	"CUP_O_TKI_Khet_Jeans_04"
];

_civilianHeadgear = [
	"CUP_H_TKI_Lungee_Open_01",
	"CUP_H_TKI_Lungee_Open_02",
	"CUP_H_TKI_Lungee_Open_03",
	"CUP_H_TKI_Lungee_Open_04",
	"CUP_H_TKI_Lungee_Open_05",
	"CUP_H_TKI_Lungee_Open_06",
	"CUP_H_TKI_Lungee_01",
	"CUP_H_TKI_Lungee_02",
	"CUP_H_TKI_Lungee_03",
	"CUP_H_TKI_Lungee_04",
	"CUP_H_TKI_Lungee_05",
	"CUP_H_TKI_Lungee_06",
	"CUP_H_TKI_Skullcap_01",
	"CUP_H_TKI_Skullcap_02",
	"CUP_H_TKI_Skullcap_03",
	"CUP_H_TKI_Skullcap_04",
	"CUP_H_TKI_Skullcap_05",
	"CUP_H_TKI_Skullcap_06",
	"CUP_H_TKI_Pakol_01",
	"CUP_H_TKI_Pakol_02",
	"CUP_H_TKI_Pakol_03",
	"CUP_H_TKI_Pakol_04",
	"CUP_H_TKI_Pakol_05",
	"CUP_H_TKI_Pakol_06"
];

_civilianFacewear = [
	"TRYK_Beard_BK",
	"TRYK_Beard_BW",
	"TRYK_Beard_BK2",
	"TRYK_Beard_BW2",
	"TRYK_Beard_BK3",
	"TRYK_Beard_BW3",
	"TRYK_Beard_BK4",
	"TRYK_Beard_BW4",
	"TRYK_Beard_BK6",
	"TRYK_Beard_BW6",
	"CUP_TK_NeckScarf",
	"CUP_FR_NeckScarf",
	"CUP_FR_NeckScarf2"
];

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

_civilianUnit = _this select 0;

_civilianUnit addUniform (_civilianUniforms select (floor (random (count _civilianUniforms))));
_civilianUnit addHeadgear (_civilianHeadgear select (floor (random (count _civilianHeadgear))));
_civilianUnit addGoggles (_civilianFacewear select (floor (random (count _civilianFacewear))));
[_civilianUnit, (_takistaniVoices select (floor (random (count _takistaniVoices))))] remoteExecCall ["setSpeaker", 0];

_civilianUnit;