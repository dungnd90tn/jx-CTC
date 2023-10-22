IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua")
--Include("\\script\\global\\writeaddressdialog.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\vng_event\\2012_vlnb\\main.lua")
Include("\\script\\global\\lottery_gold.lua")
Include("\\script\\global\\namcung\\hotroitem.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\itemblue.lua")
--Include("\\script\\global\\gm_tool\\")
SKILL_180 = {1220,1221,1223,1222,1224,1225,1227,1226,1228,1229}
local tbFaction =
{
	[1] =
	{
		szShowName = "ThiÕu L©m",
		szFaction = "shaolin",
		nShortFaction = "sl",
		tbSkill = {318, 319, 321, 709},
		tbEquip =
		{
			{
				szFaction = "ThiÕu L©m QuyÒn",
				nFirstEquipId = 4863,
				tbEquipName =
				{
					" Minh Ph­îng ch©u liªn", " Minh Ph­îng t¨ng m·o", " Minh Ph­îng th­îng giíi", " Minh Ph­îng hé uyÓn", " Minh Ph­îng yªu ®¸i",
					" Minh Ph­îng cµ sa ", " Minh Ph­îng triÒn thñ ", " Minh Ph­îng t¨ng hµi ", " Minh Ph­îng yªu trôy ", " Minh Ph­îng h¹ giíi ",
				},
			},
			{
				szFaction = "ThiÕu L©m C«n",
				nFirstEquipId = 4873,
				tbEquipName =
				{
					"Minh Ph­îng ch©u liªn", "Minh Ph­îng t¨ng m·o", "Minh Ph­îng th­îng giíi", "Minh Ph­îng hé uyÓn", "Minh Ph­îng yªu ®¸i",
					"Minh Ph­îng cµ sa", "Minh Ph­îng c«n", "Minh Ph­îng t¨ng hµi", "Minh Ph­îng yªu trôy", "Minh Ph­îng h¹ giíi", 
				},
			},
			{
				szFaction = "ThiÕu L©m §ao",
				nFirstEquipId = 4883,
				tbEquipName =
				{
					"Minh Ph­îng ch©u liªn", "Minh Ph­îng t¨ng m·o", "Minh Ph­îng th­îng giíi", "Minh Ph­îng hé uyÓn", "Minh Ph­îng yªu ®¸i",
					"Minh Ph­îng cµ sa", "Minh Ph­îng ®ao", "Minh Ph­îng t¨ng hµi", "Minh Ph­îng yªu trôy", "Minh Ph­îng h¹ giíi",
				},
			},
		},
	},
	[2] =
	{
		szShowName = "Thiªn V­¬ng Bang",
		szFaction = "tianwang",
		nShortFaction = "tw",
		tbSkill = {322, 325, 323, 708},
		tbEquip =
		{
			{
				szFaction = "Thiªn V­¬ng Chïy",
				nFirstEquipId = 4893,
				tbEquipName =
				{
					"Minh Ph­îng ®Þnh quang liªn", "Minh Ph­îng ®Þnh quang kh«i", "Minh Ph­îng ®Þnh quang th­îng giíi", "Minh Ph­îng ®Þnh quang thóc o¶n", "Minh Ph­îng ®Þnh quang yªu ®¸i",
					"Minh Ph­îng ®Þnh quang kh¶i", "Minh Ph­îng ®Þnh quang chïy", "Minh Ph­îng ®Þnh quang ngoa", "Minh Ph­îng ®Þnh quang béi", "Minh Ph­îng ®Þnh quang h¹ giíi",
				},
			},
			{
				szFaction = "Thiªn V­¬ng Th­¬ng",
				nFirstEquipId = 4903,
				tbEquipName =
				{
					"Minh Ph­îng ngù phong liªn", "Minh Ph­îng ngù phong kh«i", "Minh Ph­îng ngù phong th­îng giíi", "Minh Ph­îng ngù phong thóc o¶n", "Minh Ph­îng ngù phong yªu ®¸i",
					"Minh Ph­îng ngù phong kh¶i", "Minh Ph­îng ngù phong th­¬ng", "Minh Ph­îng ngù phong ngoa", "Minh Ph­îng ngù phong béi", "Minh Ph­îng ngù phong h¹ giíi",
				},
			},
			{
				szFaction = "Thiªn V­¬ng §ao",
				nFirstEquipId = 4913,
				tbEquipName =
				{
					"Minh Ph­îng biÓu phong liªn", "Minh Ph­îng biÓu phong kh«i", "Minh Ph­îng biÓu phong th­îng giíi", "Minh Ph­îng biÓu phong thóc o¶n", "Minh Ph­îng biÓu phong yªu ®¸i",
					"Minh Ph­îng biÓu phong kh¶i", "Minh Ph­îng biÓu phong ®ao", "Minh Ph­îng biÓu phong ngoa", "Minh Ph­îng biÓu phong béi", "Minh Ph­îng biÓu phong h¹ giíi",
				},
			},
		},
	},
	[3] =
	{
		szShowName = "§­êng M«n",
		szFaction = "tangmen",
		nShortFaction = "tm",
		tbSkill = {339, 302, 342, 710},
		tbEquip =
		{
			{
				szFaction = "Phi §ao §­êng M«n",
				nFirstEquipId = 4983,
				tbEquipName =
				{
					"Minh Ph­îng nÆc ¶nh h¹ng liªn", "Minh Ph­îng nÆc ¶nh qu¸n", "Minh Ph­îng nÆc ¶nh th­îng giíi", "Minh Ph­îng nÆc ¶nh hé uyÓn", "Minh Ph­îng nÆc ¶nh triÒn yªu",
					"Minh Ph­îng nÆc ¶nh gi¸p", "Minh Ph­îng nÆc ¶nh phi ®ao", "Minh Ph­îng nÆc ¶nh ngoa", "Minh Ph­îng nÆc ¶nh yªu trôy", "Minh Ph­îng nÆc ¶nh h¹ giíi",
				},
			},
			{
				szFaction = "Ná §­êng M«n",
				nFirstEquipId = 4993,
				tbEquipName =
				{
					"Minh Ph­îng cùc quang h¹ng liªn", "Minh Ph­îng cùc quang qu¸n", "Minh Ph­îng cùc quang th­îng giíi", "Minh Ph­îng cùc quang hé uyÓn", "Minh Ph­îng cùc quang triÒn yªu",
					"Minh Ph­îng cùc quang gi¸p", "Minh Ph­îng cùc quang ná ", "Minh Ph­îng cùc quang ngoa ", "Minh Ph­îng cùc quang yªu trôy ", "Minh Ph­îng cùc quang h¹ giíi ",
				},
			},
			{
				szFaction = "Phi Tiªu §­êng M«n",
				nFirstEquipId = 5003,
				tbEquipName =
				{
					" Minh Ph­îng th­íc kim h¹ng liªn ", " Minh Ph­îng th­íc kim qu¸n ", " Minh Ph­îng th­íc kim th­îng giíi ", " Minh Ph­îng th­íc kim hé uyÓn ", " Minh Ph­îng th­íc kim triÒn yªu ",
					" Minh Ph­îng th­íc kim gi¸p ", " Minh Ph­îng th­íc kim phi tiªu ", " Minh Ph­îng th­íc kim ngoa ", " Minh Ph­îng th­íc kim yªu trôy ", " Minh Ph­îng th­íc kim h¹ giíi ",
				},
			},
		},
	},
	[4] =
	{
		szShowName = "Ngò §éc Gi¸o",
		szFaction = "wudu",
		nShortFaction = "wu",
		tbSkill = {353, 355, 711},
		tbEquip =
		{
			{
				szFaction = "Ngò §éc Ch­ëng",
				nFirstEquipId = 4963,
				tbEquipName =
				{
					" Minh Ph­îng ®éc sa h¹ng liªn ", " H¹ch Hæ ®éc sa ph¸t ®¸i ", " Minh Ph­îng ®éc sa th­îng giíi ", " Minh Ph­îng ®éc sa hé uyÓn ", " Minh Ph­îng ®éc sa yªu ®¸i ",
					" Minh Ph­îng ®éc sa bÝ trang ", " Minh Ph­îng ®éc sa triÒn thñ ", " Minh Ph­îng ®éc sa ngoa ", " Minh Ph­îng ®éc sa yªu trôy ", " Minh Ph­îng ®éc sa h¹ giíi ",
				},
			},
			{
				szFaction = "Ngò §éc §ao",
				nFirstEquipId = 4973,
				tbEquipName =
				{
					" Minh Ph­îng u linh h¹ng liªn ", " H¹ch Hæ u linh ph¸t ®¸i ", " Minh Ph­îng u linh th­îng giíi ", " Minh Ph­îng u linh hé uyÓn ", " Minh Ph­îng u linh yªu ®¸i ",
					" Minh Ph­îng u linh bÝ trang ", " Minh Ph­îng u linh ®ao ", " Minh Ph­îng u linh ngoa ", " Minh Ph­îng u linh yªu trôy ", " Minh Ph­îng u linh h¹ giíi ",
				},
			},
		},
	},
	[5] =
	{
		szShowName = "Nga Mi",
		szFaction = "emei",
		nShortFaction = "em",
		tbSkill = {380, 328, 712},
		tbEquip =
		{
			{
				szFaction = "Nga Mi KiÕm",
				nFirstEquipId = 4923,
				tbEquipName =
				{
					"Minh Ph­îng l­u v©n ch©u liªn", "Minh Ph­îng l­u v©n ph¸t ®¸i", "Minh Ph­îng l­u v©n th­îng giíi", "Minh Ph­îng l­u v©n hé uyÓn", "Minh Ph­îng l­u v©n yªu ®¸i ",
					"Minh Ph­îng l­u v©n sam", "Minh Ph­îng l­u v©n kiÕm", "Minh Ph­îng l­u v©n ngoa", "Minh Ph­îng l­u v©n béi ", "Minh Ph­îng l­u v©n h¹ giíi ",
				},
			},
			{
				szFaction = "Nga Mi Ch­ëng",
				nFirstEquipId = 4933,
				tbEquipName =
				{
					"Minh Ph­îng hµn ngäc ch©u liªn ", "Minh Ph­îng hµn ngäc ph¸t ®¸i", "Minh Ph­îng hµn ngäc th­îng giíi", "Minh Ph­îng hµn ngäc hé uyÓn", "Minh Ph­îng hµn ngäc yªu ®¸i",
					"Minh Ph­îng hµn ngäc sam", "Minh Ph­îng hµn ngäc triÒn thñ ", "Minh Ph­îng hµn ngäc ngoa ", "Minh Ph­îng hµn ngäc béi ", "Minh Ph­îng hµn ngäc h¹ giíi ",
				},
			},
		},
	},
	[6] =
	{
		szShowName = "Thóy Yªn",
		szFaction = "cuiyan",
		nShortFaction = "cy",
		tbSkill = {336, 337, 713},
		tbEquip =
		{
			{
				szFaction = "Thóy Yªn §ao (Ngo¹i)",
				nFirstEquipId = 4943,
				tbEquipName =
				{
					"Minh Ph­îng hång nhan ch©u liªn ", "Minh Ph­îng hång nhan ph¸t ®¸i", "Minh Ph­îng hång nhan th­îng giíi", "Minh Ph­îng hång nhan hé uyÓn", "Minh Ph­îng hång nhan yªu ®¸i",
					"Minh Ph­îng hång nhan sam", "Minh Ph­îng hång nhan ®ao ", "Minh Ph­îng hång nhan ngoa ", "Minh Ph­îng hång nhan béi ", "Minh Ph­îng hång nhan h¹ giíi ",
				},
			},
			{
				szFaction = "Thóy Yªn Song §ao (Néi)",
				nFirstEquipId = 4953,
				tbEquipName =
				{
					"Minh Ph­îng ¶o th¸i ch©u liªn ", "Minh Ph­îng ¶o th¸i ph¸t ®¸i", "Minh Ph­îng ¶o th¸i th­îng giíi", "Minh Ph­îng ¶o th¸i hé uyÓn", "Minh Ph­îng ¶o th¸i yªu ®¸i",
					"Minh Ph­îng ¶o th¸i sam", "Minh Ph­îng ¶o th¸i ®ao ", "Minh Ph­îng ¶o th¸i ngoa ", "Minh Ph­îng ¶o th¸i béi ", "Minh Ph­îng ¶o th¸i h¹ giíi ",
				},
			},
		},
	},
	[7] =
	{
		szShowName = "C¸i Bang",
		szFaction = "gaibang",
		nShortFaction = "gb",
		tbSkill = {357, 359, 714},
		tbEquip =
		{
			{
				szFaction = "C¸i Bang Ch­ëng",
				nFirstEquipId = 5013,
				tbEquipName =
				{
					" Minh Ph­îng hé ph¸p h¹ng liªn", " Minh Ph­îng hé ph¸p ®Çu hoµn", " Minh Ph­îng hé ph¸p th­îng giíi ", " Minh Ph­îng hé ph¸p hé uyÓn ", " Minh Ph­îng hé ph¸p thóc yªu",
					" Minh Ph­îng hé ph¸p c¸i y", " Minh Ph­îng hé ph¸p triÒn thñ ", " Minh Ph­îng hé ph¸p ngoa ", "Minh Ph­îng hé ph¸p béi ", " Minh Ph­îng hé ph¸p h¹ giíi ",
				},
			},
			{
				szFaction = "C¸i Bang Bæng",
				nFirstEquipId = 5023,
				tbEquipName =
				{
					"Minh Ph­îng trõng giíi h¹ng liªn", "Minh Ph­îng trõng giíi ®Çu hoµn", "Minh Ph­îng trõng giíi th­îng giíi ", "Minh Ph­îng trõng giíi hé uyÓn", "Minh Ph­îng trõng giíi thóc yªu",
					"Minh Ph­îng trõng giíi c¸i y", "Minh Ph­îng trõng giíi tr­îng", "Minh Ph­îng trõng giíi ngoa", "Minh Ph­îng trõng giíi béi", "Minh Ph­îng trõng giíi h¹ giíi ",
				},
			},
		},
	},
	[8] =
	{
		szShowName = "Thiªn NhÉn Gi¸o",
		szFaction = "tianren",
		nShortFaction = "tr",
		tbSkill = {361, 362, 715},
		tbEquip =
		{
			{
				szFaction = "ChiÕn NhÉn",
				nFirstEquipId = 5033,
				tbEquipName =
				{
					"Minh Ph­îng xÝch minh h¹ng liªn", "H¹ch Hæ xÝch minh kh«i", "Minh Ph­îng xÝch minh th­îng giíi", "Minh Ph­îng xÝch minh hé o¶n", "Minh Ph­îng xÝch minh yªu ®¸i",
					"Minh Ph­îng xÝch minh gi¸p", "Minh Ph­îng xÝch minh th­¬ng", "Minh Ph­îng xÝch minh ngoa", "Minh Ph­îng xÝch minh béi", "Minh Ph­îng xÝch minh h¹ giíi",
				},
			},
			{
				szFaction = "Ma NhÉn",
				nFirstEquipId = 5043,
				tbEquipName =
				{
					"Minh Ph­îng s¸t viªm h¹ng liªn", "H¹ch Hæ s¸t viªm kh«i", "Minh Ph­îng s¸t viªm th­îng giíi", "Minh Ph­îng s¸t viªm hé o¶n", "Minh Ph­îng s¸t viªm yªu ®¸i",
					"Minh Ph­îng s¸t viªm gi¸p", "Minh Ph­îng s¸t viªm ®ao", "Minh Ph­îng s¸t viªm ngoa", "Minh Ph­îng s¸t viªm béi", "Minh Ph­îng s¸t viªm h¹ giíi",
				},
			},
		},
	},
	[9] =
	{
		szShowName = "Vâ §ang",
		szFaction = "wudang",
		nShortFaction = "wd",
		tbSkill = {365, 368, 716},
		tbEquip =
		{
			{
				szFaction = "Vâ §ang KhÝ",
				nFirstEquipId = 2935,
				tbEquipName =
				{
					" Minh Ph­îng tiªn ©m phï ", " Minh Ph­îng tiªn ©m qu¸n", " Minh Ph­îng tiªn ©m th­îng giíi ", " Minh Ph­îng tiªn ©m tô ", " Minh Ph­îng tiªn ©m ph¸p ®¸i ",
					" Minh Ph­îng tiªn ©m ®¹o bµo ", " Minh Ph­îng tiªn ©m kiÕm ", " Minh Ph­îng tiªn ©m ngoa ", " Minh Ph­îng tiªn ©m béi ", " Minh Ph­îng tiªn ©m h¹ giíi ",
				},
			},
			{
				szFaction = "Vâ §ang KiÕm",
				nFirstEquipId = 2945,
				tbEquipName =
				{
					" Minh Ph­îng ®¹o minh phï ", " Minh Ph­îng ®¹o minh qu¸n ", " Minh Ph­îng ®¹o minh th­îng giíi ", " Minh Ph­îng ®¹o minh tô ", " Minh Ph­îng ®¹o minh ph¸p ®¸i ",
					" Minh Ph­îng ®¹o minh ®¹o bµo ", " Minh Ph­îng ®¹o minh kiÕm ", " Minh Ph­îng ®¹o minh ngoa ", " Minh Ph­îng ®¹o minh béi ", " Minh Ph­îng ®¹o minh h¹ giíi ",
				},
			},
		},
	},
	[10] =
	{
		szShowName = "C«n L«n",
		szFaction = "kunlun",
		nShortFaction = "kl",
		tbSkill = {372, 375, 717},
		tbEquip =
		{
			{
				szFaction = "C«n L«n §ao",
				nFirstEquipId = 5073,
				tbEquipName =
				{
					"Minh Ph­îng thiªn canh h¹ng liªn ", "Minh Ph­îng thiªn canh ®¹o qu¸n", "Minh Ph­îng thiªn canh th­îng giíi", "Minh Ph­îng thiªn canh hé uyÓn", "Minh Ph­îng thiªn canh ph¸p ®¸i",
					"Minh Ph­îng thiªn canh ®¹o bµo", "Minh Ph­îng thiªn canh ®ao", "Minh Ph­îng thiªn canh ngoa", "Minh Ph­îng thiªn canh béi", "Minh Ph­îng thiªn canh h¹ giíi",
				},
			},
			{
				szFaction = "C«n L«n KiÕm",
				nFirstEquipId = 5083,
				tbEquipName =
				{
					"Minh Ph­îng ng¹o s­¬ng h¹ng liªn ", "Minh Ph­îng ng¹o s­¬ng ®¹o qu¸n", "Minh Ph­îng ng¹o s­¬ng th­îng giíi", "Minh Ph­îng ng¹o s­¬ng hé uyÓn", "Minh Ph­îng ng¹o s­¬ng ph¸p ®¸i",
					"Minh Ph­îng ng¹o s­¬ng ®¹o bµo", "Minh Ph­îng ng¹o s­¬ng kiÕm ", "Minh Ph­îng ng¹o s­¬ng ngoa ", "Minh Ph­îng ng¹o s­¬ng béi", "Minh Ph­îng ng¹o s­¬ng h¹ giíi",
				},
			},
		},
	},
}
local tbEquipFreeCell =
{
	{2, 1}, {2, 2}, {1, 1}, {1, 2}, {2, 1}, --¾±´ø£¬¶¥´÷£¬ÉÏ½ä£¬»¤Íó£¬Ñü´ø
	{2, 3}, {2, 4}, {2, 2}, {1, 2}, {1, 1}, --?¢Îï£¬ÎäÆ÷£¬Ñ¥×Ó£¬Ñü×¹£¬Ï¢½ä
}

local tbFactionSeries =
{
	[1] = {1, 2},
	[2] = {3, 4},
	[3] = {5, 6},
	[4] = {7, 8},
	[5] = {9, 10},
}

local tbFreeItem =
{
	{szName="Håi Thiªn T¸i T¹o CÈm Nang", tbProp={6,1,1781,1,0,0}, tbParam={60}},
	{szName="§å phæ Hoµng Kim - NgÉu Nhiªn ", tbProp={6,1,random(239,391),1,0,0}},
	{szName="Hép lÖ vËt [Qu¶ Huy Hoµng]", tbProp={6,1,1075,1,0,0}},
	{szName="Khiªu chiÕn lÔ bao", tbProp={6,1,2006,1,0,0}},
	{szName="-ThËp Toµn §¹i Bæ-", tbProp={6,1,1399,1,0,0}},
	{szName="Viªm §­Õ B¶o Tµng", tbProp={6,1,2805,1,0,0}},
	{szName="Tèng kim qu©n c«ng", tbProp={6,1,1477,1,0,0}},
	{szName="§¹i lùc", tbProp={6,1,2517,1,0,0}},
	{szName="H¹t Thiªn TuÕ", tbProp={6,1,30109,1,0,0}},
	{szName="Vßng Hoa Tù Do", tbProp={6,1,30035,1,0,0}},
	{szName="-H·n HuyÕt Long C©u-", tbProp={0,10,18,1,0,0}, nWidth=2, nHeigth=3},
}

local tbGMAccount = {"namcung", "BlackDragon", "KeyboardHero", "DarkLord", "sccddp"}

function main()
       dofile("script/global/namcung/hotrogm.lua");
	dialog_main()
end



--==========================================================================================

Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

function dmcreattongtest()
local strTongName = GetTongName()
local tszTitle = "Chµo mong b¹n ®· tham gia hÖ thèng <color=yellow>Bang Héi<color>"
if (strTongName == nil or strTongName == "") then
	Say(tszTitle,4," NhËn ®iÒu kiÖn t¹o bang héi/dmcreatetong","Gia nhËp bang héi/dmjointong","T¹o bang héi/dmcreateit","KÕt thóc ®èi tho¹i")
else
	Say(tszTitle,0)
end	
end

function dmcreatetong()	
if  GetCamp() ~= 4 then
		SetCamp(4)
		SetCurCamp(4)
		AddRepute(100000)
		AddLeadExp(1000000)
		AddLeadExp(1000000)

		AddLeadExp(1000000)

		AddEventItem(195)
		Earn(1000000)
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
Msg2Player("<color=yellow>Ng­êi ®· héi ®ñ tÊt c¶ ®iªu kiÖn ®Ó t¹o Bang Héi!<color>")
else
end
end

function dmjointong()
if  GetCamp() ~= 4 then

		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end

		SetCamp(4)
		SetCurCamp(4)
Msg2Player("<color=yellow>Gia nhËp Bang héi thµnh c«ng!<color>")
else
end
end

function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("TiÕp tôc t¹o bang." ,2,"T¹o bang/Direct_CreateTong","Chß mét phót/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "Ng­êi ch¬i: KiÕm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi ca thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?", "KiÕm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i ca ®ñ n¨ng lùc l·nh ®¹o, ca 16 ng­êi cïng chU h­íng cïng ng­¬i lËp bang, tr¶i qua 3 ngµy Kh¶o NghiÖm Kú ", "Ch­ëng m«n nh©n:  NOu trong 3 ngµy ca ng­êi rêi bang th× néi trong 3 ngµy ®a ng­êi ph¶i t×m ng­êi kh¸c thay thO.", "Ch­ëng m«n nh©n:  Ng­¬i ph¶i ca ®ñ tµi l·nh ®¹o vµ tUn vËt ®a lµ Nh¹c V­¬ng KiOm", "Ng­êi ch¬i: Nh¹c V­¬ng KiOm ? Ng­êi nai lµ thanh kiOm nµy µ ? ", "KiOm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· ca na... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!! ")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "KiÕm hiÖp ch­ëng m«n nh©n: nÕu nh­ t­ëng thµnh lËp chÝnh ®Ých bang héi, sÏ v× tha nç lùc ®¹i l­îng thêi gian tinh lùc d÷ t©m huyÕt, thiÕt bÊt kh¶ bá vë nöa chõng")
		else
			Talk(6,"", "KiÕm hiÖp ch­ëng m«n nh©n: ng­¬i vÊn thµnh lËp bang héi h÷u ®iÒu kiÖn g×, ta lai chËm r·i ®Ých gi¶ng cho ng­¬i nghe", "KiÕm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ng­¬i ph¶i ®· xuÊt s­ ®éc lËp míi b­íc ch©n vµo giang hå; thø nh× ng­¬i kh«ng thÓ t¹i bÊt luËn c¸i g× bang héi trung; lÇn thø hai ng­¬i yÕu cã nhÊt ®Þnh ®Ých giang hå danh väng; tèi hËu cña ng­¬i chØ huy lùc bÊt n¨ng nhá 30 cÊp")
		end
	end
end

function create_pay()
	Say("KiÕm hiÖp ch­ëng m«n nh©n: Ng­¬i cÇn lÖ phi lµ 100 v¹n l­îng b¹c." ,2,"Kh«ng thµnh vÊn ®ª, ta ca ®em 100v l­îng ®©y! /create_pay_yes","H©y dµ, ta kh«ng ®em ®ñ tiªn råi. /create_pay_no")

--	Say("½£ÏµÕÆ·ÅÈË£ºÄÇ·´£¬ÄãÖ»ÒªÓÐ×ã¹»µÄ×Ê½ðÈ·°ïÅÉÄÜ¹»ÔË×ªÆðµ´¾Ý¿ÉÒÔ¸Ë£¬±ÈÈçËµÓÐ¸ö100Ýò¸½¸½×Ó°É¡£" ,2,"·»ÎÊî}£¬?ÒÒÑ¾­Ó?00Ýò¸½¸½×Ó¸Ë/create_pay_yes","Ì«·ÑÇ®?Ë£¬ÉïÒ»µãÐÐ²»Ð?create_pay_no")
end
function create_pay_yes()

	if (GetCash() >= 1000000) then
		Pay(1000000)				-- ÊÕ·Ñ
		DelItem(195)			-- É¾³ýÏµ¹Øµµ¾ß
		SetTask(99,1)				-- ²¢´òÉÏ±ê¼Ç£¨Ý¬Ê±¶¨ÒåÎª°ïÅÉÖÐµÄµóÒ»¸öÈË£¨¼´°ïÖ÷±¾ÈË£©£©
		Direct_CreateTong()		-- ¿ªÊ¼½¨°ï
		
	else
		Talk(1,"", "KiÕm hiÖp ch­ëng m«n nh©n: ViÖc duy tr× bang héi rÊt tèn tiÒn, ng­êi ph¶i cè g¾ng cïng mäi ng­êi tUch gap ®Ó bang ®­îc giµu m¹nh. ")	end
end


function Direct_CreateTong()
	CreateTong(1)				-- µ¯³ö½¨°ï¶Ô»°¿ò£¬½áÊø½Å±¾¿ØÖÆ
end

--==========================================================================================
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua");

function namcung2()
	if CheckAccountGM() then
	local szTitle = "<npc>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
	local tbOpt =
	{
		{"LËp Bang Nhanh.", dmcreattongtest},
		{"T¨ng cÊp 200", level_up_to190},
		{"ChuyÓn sinh MiÔn PhÝ.", transfer},
		{"NhËp Ph¸i Vµ NhËn Skills 120", choose_faction},
		{"Trang bÞ HKMP", hoangkimmpfull},
		{"NhËn §å Xanh", trangbixanh},
		{"NhËn 1000 V¹n", tienvan},
		{"NhËn 100 TiÒn §ång", tiendong},
		{"Danh väng,Phóc duyªn", danhvongphucduyen},
		{"Tµi l·nh ®¹o", lanhdao},
		{"TÈy ®iÓm", clear_attibute_point},
		--{"NhËn ®iÓm", hotro},
		{"Thay ®æi Mµu PK", trangthai},
		{"LÊy ngùa", layngua},	
		{"Tho¸t"},
	}
	local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			tinsert(tbOpt, 1, {"ChuyÓn thµnh tµi kho¶n GM", gm_function})
			tinsert(tbOpt, 1, {"NhËn lÖnh bµi BOSS", gm_functionboss})
			tinsert(tbOpt, 1, {"T«i muèn th»ng cÊp lªn 190", level_up_to190})
			tinsert(tbOpt, 1, {"T«i muèn nhËn trang bÞ", show_item})
			tinsert(tbOpt, 1, {"T«i muèn nhËn trang bÞ B¹ch Hæ", show_faction})
			tinsert(tbOpt, 1, {"T«i muèn tÈy tñy", clear_attibute_point})
			break
		end
	end
	CreateNewSayEx(szTitle, tbOpt)
elseif CheckAccountMod() then
	local szTitle = "<npc>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
	local tbOpt =
	{
		--{"LËp Bang Nhanh.", dmcreattongtest},
		{"T¨ng cÊp 200", level_up_to190},
		--{"ChuyÓn sinh MiÔn PhÝ.", transfer},
		{"NhËp Ph¸i Vµ NhËn Skills 120", choose_faction},
		--{"Trang bÞ HKMP", hoangkimmpfull},
		--{"NhËn 1000 V¹n", tienvan},
		--{"NhËn 100 TiÒn §ång", tiendong},
		{"Danh väng,Phóc duyªn", danhvongphucduyen},
		{"Tµi l·nh ®¹o", lanhdao},
		{"TÈy ®iÓm", clear_attibute_point},
		--{"NhËn ®iÓm", hotro},
		{"Thay ®æi Mµu PK", trangthai},
		--{"LÊy ngùa", layngua},	
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
else
	local szTitle = "<npc>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
	local tbOpt =
	{
		{"NhËp Ph¸i Vµ NhËn Skills 120", choose_faction},
		{"Trang bÞ HKMP", hoangkimmpfull},
		{"NhËn Bé An Bang", nhananbang},
		{"NhËn Bé §Þnh Quèc", nhandinhquoc},
		{"NhËn §å Xanh", trangbixanh},
		{"NhËn §å TÝm", dotim},
		{"NhËn §¸", khoangth},
		{"T¨ng cÊp 120", cap120},
		{"NhËn 2000 V¹n", tienvan2},
		{"NhËn 500 TiÒn §ång", tiendong2},	
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
end


function nhananbang()
		for i=164,167 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end	
end;
function nhandinhquoc()
		for i=159,163 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end	
end;


function tienvan2()
	Earn(20000000)	
end;

function cap120()
	local nCurLevel = GetLevel()
	if nCurLevel >= 120 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 120 råi.")
		return
	end
	local nAddLevel = 120 - nCurLevel
	ST_LevelUp(nAddLevel)	
end;

function tiendong2()
	for i = 1,5 do
		AddStackItem(100,4,417,1,1,0,0,0)	-- nhan 100 tien dong
	end
end;

function cucphkhac()
dohoangkim()
end
function nguhanh()
local szTitle = "<npc>Ng­¬i cÇn g×?"
	local tbOpt =
	{
		{"ChuyÓn ®æi sang n÷ hÖ Kim", nukim},
		{"Chuyªn ®æi sang nam hÖ Thuy", namthuy},
		{"Tho¸t"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end
function nukim()
if GetSex() == 1 then
SetSeries(0)
KickOutSelf()
	else
	Talk(1,"","Ng­¬i lµ Pª §ª µ ?")
end
end

function namthuy()
if GetSex() == 0 then
SetSeries(2)
KickOutSelf()
	else
	Talk(1,"","Vui lßng kiÓm tra l¹i giíi tÝnh")
end
end

function nhanskill180()
	local nFaction = GetLastFactionNumber() + 1
	if nFaction==0 then
		Say("Kh«ng cã m«n ph¸i mµ ®åi nhËn skill thÊt truyÒn, ta kh«ng cã thêi gian ®ïa víi ng­¬i", 0)
		return
	else
		for i=1,10 do
			if (nFaction==i) then
				if (HaveMagic(SKILL_180[i]) == -1) then
					AddMagic(SKILL_180[i],20)
					Say("B¹n häc ®­îc kü n¨ng cÊp 180 <color=yellow>"..GetSkillName(SKILL_180[i]), 0)
				else
					Say("Ng­¬i ®· cã kü n¨ng thÊt truyÒn råi, ®õng tham lam", 0)
					return
				end
			end
		end
	end
end
function bachkim()
	local tbOpt =
	{
		{"ThiÕu l©m", bktl},
		{"Thiªn v­¬ng", bktv},
		{"®­êng m«n", bkdm},
		{"Ngò ®éc", bk5d},
		{"Nga mi", bknm},
		{"Thuý yªn", bkty},
		{"C¸i bang", bkcb},
		{"Thiªn nhÉn", bktn},
		{"Vâ ®ang", bkvd},
		{"C«n l«n", bkcl},
		{"Trë l¹i", dialog_main},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän m«n ph¸i?", tbOpt)
end
function bktl()
AddGoldItem(0, 11)
AddGoldItem(0, 6)
end
function bktv()
AddGoldItem(0, 16)
AddGoldItem(0, 21)
AddGoldItem(0, 26)
end
function bknm()
AddGoldItem(0, 31)
end
function bkty()
AddGoldItem(0, 46)
end
function bk5d()
AddGoldItem(0, 61)
end
function bkdm()
AddGoldItem(0, 71)
AddGoldItem(0, 76)
AddGoldItem(0, 81)
end
function bkcb()
AddGoldItem(0, 96)
end
function bktn()
AddGoldItem(0, 101)
end
function bkvd()
for i=4346,4355 do
AddPlatinaItem(3, i)
end
end
function bkcl()
AddGoldItem(0, 126)
end
function hacthan()
for i=3890,3894 do
AddGoldItem(0, i)
end
end
function matna1()
for i=4493,4523 do
AddGoldItem(0, i)
end
end
function matna2()
for i=4524,4554 do
AddGoldItem(0, i)
end
end
function matna3()
for i=4555,4585 do
AddGoldItem(0, i)
end
end
function matna4()
for i=4586,4616 do
AddGoldItem(0, i)
end
end
function matna5()
for i=4617,4630 do
AddGoldItem(0, i)
end
end


function hotro()
	local tbOpt =
	{
		--{"T¨ng kinh nghiÖm", kn},
		--{"TiÒn", tien},
		--{"TÈy ®iÓm", clear_attibute_point},
		--{"§iÓm Kü N¨ng", pointkynang},
		--{"§iÓm TiÒm N¨ng", pointtiemnang},
		--{"B¸nh trung thu ", banhtrungthu},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Anh cÇn g×?", tbOpt)
end

function pointkynang()
AddMagicPoint(100)
KickOutSelf()
end;

function pointtiemnang()
AddProp(1000)
end;

	
function lanhdao()
	for i=1,20 do
AddLeadExp(10000000)
end
end

function kn()
for i=1,80 do
AddOwnExp(1000000000)
end
end

function tien1()
Earn(10000000)
end


function tien()
Earn(100000000)
end

function danhvongphucduyen()
	AddRepute(100000);
	FuYuan_Start();
	FuYuan_Add(100000);
end
function conghien()
AddContribution(100000)
end

function trungsinh()
AddReBorn(10)
end
function gm_functionboss()
	for i =1,10 do
		AddItem(6,1,1022,0,0,0)
	end
end
function moreitem()
	local tab_Content = {
		"Trang BÞ VIP /tbvip",
		"LÖnh bµi gäi boss /goiboss",
		--"LÊy Cùc PhÈm /tbcucph",
		--"Vßng s¸ng danh hiÖu/danhhieu",
		"LÊy 100 tiÒn ®ång /tiendong",
		"LÊy 1000v l­îng /tienvan",
		--"Vâ l©m ngò b¸ /#tbVngVLNB2012:main()",
		--"LÔ quan 2 /#onLotteryGold_Gain()",
		--"Thiªn H¹ §Ö NhÊt Bang/#GetBonusTHDNB7_main()",
		"Th«i kh«ng lÊy g× n÷a hOt."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;
function tbvip()
	local tbOpt =
	{	
		{"Trang BÞ HuyÒn Tinh ( TÝm )", huyentim},
		--{"Set Hoµng Kim M«n Ph¸i", sethkmp},
		--{"Set XÝch L©n ", setxl},
		--{"Set Cùc PhÈm §éng S¸t ", cpds},
		--{"Set Minh Ph­îng ", setmp},		
		--{"Set Song Long", setsonglo},		
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc> Xin §ai hiÖp lùa chän", tbOpt)
end

function huyentim()
dotim()
end
function danhhieu()
	local tbOpt =
	{
		{"Vßng s¸ng VLMC", vongsa},
		{"Vßng s¸ng 1 ", abcxyz},
		{"Vßng s¸ng 2 ", abcxyz1},
		{"Vßng s¸ng 3 ", abcxyz2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc> Xin §ai hiÖp lùa chän", tbOpt)
end


function tienvan()
	Earn(10000000)	
end;

function tbcucph()
	cucpham()	
end;
function tiendong()
	for i =1,3 do
	AddStackItem(100,4,417,1,1,0,0,0)	-- nhan 300 tien dong
end
end;
function vongsa()
n_title = 3000 -- S?a ID danh hi?u vào
local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
local nDate = FormatTime2Number(nServerTime);
local nDay = floor(mod(nDate,1000000) / 10000);
local nMon = mod(floor(nDate / 1000000) , 100)
local nTime = nMon * 1000000 + nDay * 10000 
Title_AddTitle(n_title, 2, nTime)
Title_ActiveTitle(n_title)
end

function layngua()
	local tbOpt =
	{
		{"Ngùa nhãm 1", vip1},
		{"Ngùa nhãm 2", vip2},
		{"Ngùa nhãm 3", vip3},
		--{"Ngùa nhãm 4", vip4},
		--{"Ngùa b¸ ®¹o", nguabadao},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Anh cÇn g×?", tbOpt)
end

function nguabadao()
	AddGoldItem(0, 4480)
	AddGoldItem(0, 4366)
for i=5093,5097 do
AddGoldItem(0, i)
end
end
function vip1()
AddItem(0,10,6,10,0,0,0)
AddItem(0,10,7,10,0,0,0)
AddItem(0,10,8,10,0,0,0)
AddItem(0,10,9,10,0,0,0)
AddItem(0,10,10,10,0,0,0)
end
function vip2()
AddItem(0,10,11,10,0,0,0)
AddItem(0,10,12,10,0,0,0)
AddItem(0,10,13,10,0,0,0)
AddItem(0,10,14,10,0,0,0)
AddItem(0,10,15,10,0,0,0)
end
function vip3()
AddItem(0,10,16,10,0,0,0)
AddItem(0,10,17,10,0,0,0)
AddItem(0,10,18,10,0,0,0)
AddItem(0,10,19,10,0,0,0)
AddItem(0,10,20,10,0,0,0)
end
function vip4()
AddItem(0,10,21,10,0,0,0)
AddItem(0,10,22,10,0,0,0)
AddItem(0,10,23,10,0,0,0)
AddItem(0,10,24,10,0,0,0)
AddItem(0,10,25,10,0,0,0)
end
function gm_function()
	local nCurLevel = GetLevel()
	if nCurLevel < 150 then
		ST_LevelUp(150 - nCurLevel)
	end
	SetFightState(0)
	SetCamp(6)
	SetCurCamp(6)
	AddMagic(732, 1)--Ë²ÒÆ
	AddMagic(733, 1)--ÒþÉí
	if CalcFreeItemCellCount() >= 1 then
		local tbItem = {szName="TruyÒn tèng quyÒn tr­îng", tbProp={6,1,2766,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem, "Tµi kho¶n Gm nhËn ®¹o cô", 1)
	end
end
function level_up_to150()
	local nCurLevel = GetLevel()
	if nCurLevel >= 150 then
		if ST_IsTransLife() == 1 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 150 råi.")
		else
			Talk(1, "", "§i chuyÓn sinh tr­íc ®i råi trë l¹i th¨ng cÊp.")
		end
		return
	end
	local nAddLevel = 150 - nCurLevel
	ST_LevelUp(nAddLevel)
end
function level_up_to190()
	local nCurLevel = GetLevel()
	if nCurLevel >= 200 then
		if ST_IsTransLife() == 1 then
			Talk(1, "", "Ng­¬i ®· ®¹t cÊp 200 råi.")
		else
			Talk(1, "", "§i chuyÓn sinh tr­íc ®i råi trë l¹i th¨ng cÊp.")
		end
		return
	end
	local nAddLevel = 200 - nCurLevel
	ST_LevelUp(nAddLevel)
end

function transfer()
	if GetLevel() < 190 then
		Talk(1, "", "CÊp 190 trë lªn míi ca thÓ chuyÓn sinh.")
		return
	end
	if (GetCash() <= 100000000) then
		Talk(1, "", "Ph¶i ca ®ñ 10k v¹n míi ca thÓ chuyÓn sinh.")
		return
	end
	Pay(100000000)
	ST_DoTransLife()
end

function check_faction()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

function choose_faction()
	if check_faction() ~= 1 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local nSeries = GetSeries() + 1
	local tbOpt = {}
	for i=1, getn(%tbFactionSeries[nSeries]) do
		local nIndex = %tbFactionSeries[nSeries][i]
		tinsert(tbOpt, {%tbFaction[nIndex].szShowName, set_faction, {nIndex}})
	end
	tinsert(tbOpt, {"Trë vÒ", dialog_main})
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	CreateNewSayEx("<npc>Mét khi gia nhËp m«n ph¸i kh«ng thÓ thay ®æi, h·y suy nghÜ kü.", tbOpt)
end

function set_faction(nIndex)
	local szTitle = format("<npc>X¸c nhËn muèn gia nhËp m«n ph¸i ?<color=yellow>%s<color> m«n ph¸i?", %tbFaction[nIndex].szShowName)
	local tbOpt =
	{
		{"X¸c nhËn!", do_set_faction, {nIndex}},
		{"Trë vÒ.", choose_faction},
		{"KOt thóc ®èi tho¹i."},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function do_set_faction(nIndex)
	if check_faction() ~= 1 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local nResult = SetFaction(%tbFaction[nIndex].szFaction)
	if nResult == 0 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", %tbFaction[nIndex].nShortFaction, 0)
	for i=1, getn(%tbFaction[nIndex].tbSkill) do--90£¬120£¬150¼¶¼¼ÄÜ
		AddMagic(%tbFaction[nIndex].tbSkill[i], 20)
	end
	AddMagic(210, 1)--?»¼¶Çá¹¦
	Talk(1, "KickOutSelf", format("Ng­¬i ®· gia nhËp thµnh c«ng ph¸i %s", %tbFaction[nIndex].szShowName))
end

function show_faction()
	if check_faction() == 1 then
		Talk(1, "", "Gia nhËp m«n ph¸i míi ca thÓ nhËn trang bÞ")
		return
	end
	local nFactionId = GetLastFactionNumber() + 1
	local tbOpt = {}
	local tbSubFaction = %tbFaction[nFactionId].tbEquip
	for i=1, getn(tbSubFaction) do
		tinsert(tbOpt, {tbSubFaction[i].szFaction, show_equip, {nFactionId, i}})
	end
	tinsert(tbOpt, {"Trë vÒ.", dialog_main})
--	tinsert(tbOpt, {"
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	CreateNewSayEx("<npc>Xin mêi lùa chän ph¸i.", tbOpt)
end

function show_equip(nFactionId, nSubFactionId)
	local tbEquip = %tbFaction[nFactionId]["tbEquip"][nSubFactionId]
	local tbEquipName = tbEquip["tbEquipName"]
	local nFirstEquipId = tbEquip["nFirstEquipId"]
	local tbOpt = {}
	for i=1, getn(tbEquipName) do
		tinsert(tbOpt, {tbEquipName[i], get_equip, {i, nFirstEquipId + i - 1}})
	end
	tinsert(tbOpt, {"Trë vÒ", show_faction})
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	local szTitle = format("<npc>LÊy ®å %s Kim ¤", tbEquip.szFaction)
	CreateNewSayEx(szTitle, tbOpt)
end

function get_equip(nIndex, nEquipId)
	local nWidth = %tbEquipFreeCell[nIndex][1]
	local nHeigth = %tbEquipFreeCell[nIndex][2]
	if CountFreeRoomByWH(nWidth, nHeigth) < 1 then
		Talk(1, "", format("CÇn Ut nhÊt 1 c¸i %dx%d tói ®eo l­ng", nWidth, nHeigth))
		return
	end
	AddGoldItem(0, nEquipId)
end

function show_item()
	local tbOpt = {}
	local nCount = getn(%tbFreeItem)
	local szOption = ""
	for i=1, nCount-1 do
		szOption = format("NhËn %s", %tbFreeItem[i].szName)
		tinsert(tbOpt, {szOption, get_item, {i}})
	end
	szOption = format("NhËn %s", %tbFreeItem[nCount].szName)
	tinsert(tbOpt, {szOption, get_single_item, {nCount}})
	tinsert(tbOpt, {"NhËn cùc phÈm giíi chØ...", get_normal_item})
	tinsert(tbOpt, {"Trë vÒ.", dialog_main})
	tinsert(tbOpt, {"KOt thóc ®èi tho¹i."})
	CreateNewSayEx("<npc>l·o phu n¬i nµy ca h¬i thë nham vËt phÈm nh­ng nhËn lÊy", tbOpt)
end


function get_normal_item()
	local tbOpt =
	{
		{"NhËn 5 viªn KNB.", cszb},
		{"H­ng Bang Chi Giíi", xb_jz},
		{"TrÊn Nh¹c Chi Giíi", zy_jz},
		{"Th­îng Ph­¬ng Chi Giíi", sf_jz},
		{"Thiªn Hµ Giíi", sh_jz},
		{"§O Hoµng Chi Giíi", dh_jz},
		{"Thiªn Tö Chi Giíi", tz_jz},
		{"ThO Tóc Toµn Giíi", sz_jz},
		{"Cµn Kh«n Giíi ChØ (Cùc phÈm)", jz08},
		{"L·nh B¸ Nguyªn Méng Chi Giíi (Míi)", jz08x},
		{"Trë vÒ.", namcung2},
		{"KOt thóc ®èi tho¹i."},
	}
	CreateNewSayEx("<npc>L·o phu ca mét sè man cùc phÈm, ng­êi cÇn thøc g× ?", tbOpt)
end

function fifong()
	local tbOpt =
	{
		{"V©t phÈm hæ trî", hotrothem},
		{"Phi phong", phiphong},
		--{"MÆt n¹", matna},
		{"Ên", an},
		{"Trang søc", trangsuc1},
		{"Vò liÖt", vuliet},
		--{"Huynh ®Ö", huynhde},
		--{"Cè s¬n", coson},
		--{"D­¬ng thÇn", duongthan},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end

function hotrothem()
	local szTitle = "<npc>Xin ®¹i hiªp chän l÷a "
	local tbOpt =
	{
		{"§¸ Ðp ®å.", daep},
		{"LÊy item bang héi.", banghoi},
		{"ThÇn bÝ kho¸ng th¹ch.", tbkt},
		{"Thuèc l¾c.", thuoclac},
		{"Ta muèn lÊy ®å B¹ch Hæ.", show_faction},	
		{"Ta muèn lÊy B¹ch Kim", bachkim},
		{"KÕt thóc ®èi tho¹i."},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function trangsuc()
	local tbOpt =
	{
		{"Trang søc 1", trangsuc1},
		{"Trang søc 2", trangsuc2},
		{"Trang søc 3", trangsuc3},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end
function an23()
	local tbOpt =
	{
		{"Ên 1", an1},
		{"Ên 2", an2},
		{"Ên 3", an3},
		{"Ên 4", an4},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end
function matna()
	local tbOpt =
	{
		--{"MÆt n¹ 1", matna1},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän item", tbOpt)
end
function trangthai()
	local tbOpt =
	{
		{"ChÝnh ph¸i", mauvang},
		{"Tµ ph¸i", mautim},
		{"Trung lËp", mauxanh},
		{"S¸t Thñ", maudo},
		{"Trë l¹i", namcung2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän mµu", tbOpt)
end
function mauvang()
		SetCurCamp(1)
		SetCamp(1)
end
function mautim()
		SetCurCamp(2)
		SetCamp(2)	
end
function mauxanh()
		SetCurCamp(3)
		SetCamp(3)	
end
function maudo()
		SetCurCamp(4)
		SetCamp(4)	
end
function an4()
	for i=5161,5197 do
	AddGoldItem(0, i)
	end
end
function an3()
	for i=5131,5161 do
	AddGoldItem(0, i)
end
end
function an2()
	for i=5098,5130 do
	AddGoldItem(0, i)
	end
end
function coson()
	AddGoldItem(0, 4441)
	AddGoldItem(0, 4445)
	AddGoldItem(0, 4449)
	AddGoldItem(0, 4453)
	AddGoldItem(0, 4457)
	AddGoldItem(0, 4461)
	AddGoldItem(0, 4465)
	AddGoldItem(0, 4469)
end
function huynhde()
	for i=4436,4437 do
	AddGoldItem(0, i)
end
	for i=4481,4482 do
	AddGoldItem(0, i)
end
end
function vuliet()
	for i=5208,5212 do
	AddGoldItem(0, i)
	end
end
function pro1()
	for i=430,441 do
	AddGoldItem(0, i)
	end
end
function dongsat()
for i=494,497 do
AddGoldItem(0, i)
end
for i=378,379 do
AddGoldItem(0, i)
end
end	
function duongthan()
for i=514,520 do
AddGoldItem(0, i)
end
end
function phiphong()
for i=3465,3490 do
AddGoldItem(0, i)
end
end
function an()
for i=3205,3234 do
AddGoldItem(0, i)
end
end
function trangsuc1()
for i=3542,3554 do
AddGoldItem(0, i)
end
for i=3491,3506 do
AddGoldItem(0, i)
end
end
function trangsuc2()
for i=5241,5261 do
AddGoldItem(0, i)
end
end
function trangsuc3()
	for i=5262,5289 do
	AddGoldItem(0, i)
	end
end
---Hoan kim mon phai.
function sethkmp()
	local tab_Content = {
		"Rêi khái/no",
		"ThiÕu L©m quyÒn/#sethkmp1(1)",
		"ThiÕu L©m c«n/#sethkmp1(2)",
		"ThiÕu L©m ®ao/#sethkmp1(3)",
		"Thiªn V­¬ng chïy/#sethkmp1(4)",
		"Thiªn V­¬ng th­¬ng/#sethkmp1(5)",
		"Thiªn V­¬ng ®ao/#sethkmp1(6)",
		"Nga My kiÕm/#sethkmp1(7)",
		"Nga My ch­ëng/#sethkmp1(8)",
		"Nga My buff/#sethkmp1(9)",
		"Thóy Yªn ®ao/#sethkmp1(10)",
		"Thóy Yªn song ®ao/#sethkmp1(11)",
		"Ngò §éc ch­ëng/#sethkmp1(12)",
		"Ngò §éc ®ao/#sethkmp1(13)",
		"Ngò §éc bïa/#sethkmp1(14)",
		"Trang sau/sethkmp2",
		
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethkmp2()
	local tab_Content = {
		"Rêi khái/no",
		"§­êng M«n phi ®ao/#sethkmp1(15)",
		"§­êng M«n tô tiÔn/#sethkmp1(16)",
		"§­êng M«n phi tiªu/#sethkmp1(17)",
		"§­êng M«n bÉy/#sethkmp1(18)",
		"C¸i Bang rång/#sethkmp1(19)",
		"C¸i Bang bæng/#sethkmp1(20)",
		"Thiªn NhÉn kÝch/#sethkmp1(21)",
		"Thiªn NhÉn ®ao/#sethkmp1(22)",
		"Thiªn NhÉn bïa/#sethkmp1(23)",
		"Vâ §ang khÝ /#sethkmp1(24)",
		"Vâ §ang kiÕm/#sethkmp1(25)",
		"C«n L«n ®ao/#sethkmp1(26)",
		"C«n L«n kiÕm/#sethkmp1(27)",
		"C«n L«n bïa/#sethkmp1(28)",
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethkmp1(nId)
	for i=1,5 do AddGoldItem(0,5*nId+i-5) end
end
--xich lan
function setxl()
local tab_Content = {
	"Roi Khoi/no",
	"ThiÕu L©m quyÒn/#setxl1(1)",
	"ThiÕu L©m bæng/#setxl1(2)",
	"ThiÕu L©m ®ao/#setxl1(3)",
	"Thiªn V­¬ng chïy/#setxl1(4)",
	"Thiªn V­¬ng th­¬ng/#setxl1(5)",
	"Thiªn V­¬ng ®ao/#setxl1(6)",
	"Nga My kiÕm/#setxl1(7)",
	"Nga My ch­uong/#setxl1(8)",
	"Thóy Yªn ®ao/#setxl1(9)",
	"Thóy Yªn song ®ao/#setxl1(10)",
	"Ngò §äc ch­ëng/#setxl1(11)",
	"Ngò §äc ®ao/#setxl1(12)",
	"§­êng M«n phi ®ao/#setxl1(13)",
	"§­êng M«n tiÔn/#setxl1(14)",
	"Trang sau/setxl2",

}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setxl2()
local tab_Content = {
	"Roi Khoi/no",
	"Duong Mon Phi Tieu/#setxl1(15)",
	"Cai Bang Rong/#setxl1(16)",
	"Cai Bang Bong/#setxl1(17)",
	"Thien Nhan Kich/#setxl1(18)",
	"Thien Nhan Dao/#setxl1(19)",
	"Vo Dang Kiem/#setxl1(20)",
	"Vo Dang Quyen/#setxl1(21)",
	"Con Lon Dao/#setxl1(22)",
	"Con Lon Kiem/#setxl1(23)",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setxl1(nId)
for i=2515,2525 do AddGoldItem(0,10*nId+i-10) end
end
--cuc pham
function cpds()
	AddGoldItem(0,494)
	AddGoldItem(0,495)
	AddGoldItem(0,496)
	AddGoldItem(0,497)
end
--set minh phung
function setmp()
	local tab_Content = {
		"Roi Khoi/no",
		"Thieu Lam Quyen/#setmp1(1)",
		"Thieu Lam Bong/#setmp1(2)",
		"Thieu Lam Dao/#setmp1(3)",
		"Thien Vuong Chuy/#setmp1(4)",
		"Thien Vuong Thuong/#setmp1(5)",
		"Thien Vuong Dao/#setmp1(6)",
		"Nga My kiem/#setmp1(7)",
		"Nga My ch­uong/#setmp1(8)",
		"Thuy Yen Dao/#setmp1(9)",
		"Thuy yen Song Dao/#setmp1(10)",
		"Ngu Doc Chuong/#setmp1(11)",
		"Ngu Doc Dao/#setmp1(12)",
		"Duong Mon Phi Dao/#setmp1(13)",
		"Duong Mon No/#setmp1(14)",
		"Trang sau/setmp2",

	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setmp2()
local tab_Content = {
	"Roi Khoi/no",
	"Duong Mon Phi Tieu/#setmp1(15)",
	"Cai Bang Rong/#setmp1(16)",
	"Cai Bang Bong/#setmp1(17)",
	"Thien Nhan Kich/#setmp1(18)",
	"Thien Nhan Dao/#setmp1(19)",
	"Vo Dang Kiem/#setmp1(20)",
	"Vo Dang Quyen/#setmp1(21)",
	"Con Lon Dao/#setmp1(22)",
	"Con Lon Kiem/#setmp1(23)",

}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setmp1(nId)
for i=2745,2755 do AddGoldItem(0,10*nId+i-10) end
end
-- set song long 
function setsonglo()
	local tab_Content = {
		"Rêi khái/no",
		"ThiÕu L©m quyÒn/#setsonglo1(1)",
		"ThiÕu L©m c«n/#setsonglo1(2)",
		"ThiÕu L©m ®ao/#setsonglo1(3)",
		"Thiªn V­¬ng chïy/#setsonglo1(4)",
		"Thiªn V­¬ng th­¬ng/#setsonglo1(5)",
		"Thiªn V­¬ng ®ao/#setsonglo1(6)",
		"Nga My kiÕm/#setsonglo1(7)",
		"Nga My ch­ëng/#setsonglo1(8)",
		"Nga My buff/#setsonglo1(9)",
		"Thóy Yªn ®ao/#setsonglo1(10)",
		"Thóy Yªn song ®ao/#setsonglo1(11)",
		"Ngò §éc ch­ëng/#setsonglo1(12)",
		"Ngò §éc ®ao/#setsonglo1(13)",
		"Ngò §éc bïa/#setsonglo1(14)",
		"Trang sau/setsonglo2",
		
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setsonglo2()
	local tab_Content = {
		"Rêi khái/no",
		"§­êng M«n phi ®ao/#setsonglo1(15)",
		"§­êng M«n tô tiÔn/#setsonglo1(16)",
		"§­êng M«n phi tiªu/#setsonglo1(17)",
		"§­êng M«n bÉy/#setsonglo1(18)",
		"C¸i Bang rång/#setsonglo1(19)",
		"C¸i Bang bæng/#setsonglo1(20)",
		"Thiªn NhÉn kÝch/#setsonglo1(21)",
		"Thiªn NhÉn ®ao/#setsonglo1(22)",
		"Thiªn NhÉn bïa/#setsonglo1(23)",
		"Vâ §ang khÝ /#setsonglo1(24)",
		"Vâ §ang kiÕm/#setsonglo1(25)",
		"C«n L«n ®ao/#setsonglo1(26)",
		"C«n L«n kiÕm/#setsonglo1(27)",
		"C«n L«n bïa/#setsonglo1(28)",
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setsonglo1(nId)
for i=2975,2985 do AddGoldItem(0,10*nId+i-10) end
end
function cszb()
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
end
function xb_jz()
	AddGoldItem(0, 508)
end	
function zy_jz()
	AddGoldItem(0, 509)
end	
function sf_jz()
	AddGoldItem(0, 510)
end	
function sh_jz()
	AddGoldItem(0, 511)
end	
function dh_jz()
	AddGoldItem(0, 530)
end	
function tz_jz()
	AddGoldItem(0, 531)
end	
function sz_jz()
	AddGoldItem(0, 498)
end	
function jz08()
	AddGoldItem(0, 3878)
end	
function jz08x()
	AddGoldItem(0, 3541)
end	


function goiboss()
	for i =1,10 do
		AddItem(6,1,1022,0,0,0)
	end
end
function xxxx()
	AddItem(6,1,1022,0,0,0)
	AddItem(6,1,2061,0,0,0)
	AddItem(6,1,30227,1,0,0)
	AddItem(6,1,2349,0,0,0)
	AddItem(6,1,2371,0,0,0)
	AddItem(6,1,2595,0,0,0)
	AddItem(6,1,30125,0,0,0)

	AddItem(6,1,3083,0,0,0)
	AddItem(6,1,3084,0,0,0)
	AddItem(6,1,3085,0,0,0)

-------phientoan

AddItem(6,1,1308,0,0,0)
AddItem(6,1,1309,0,0,0)
AddItem(6,1,1310,0,0,0)

AddItem(6,1,2127,0,0,0)
AddItem(6,1,2160,0,0,0)
AddItem(6,1,2161,0,0,0)

AddItem(6,1,2162,0,0,0)
AddItem(6,1,398,0,0,0)
AddItem(6,1,1309,0,0,0)




--caythong
AddItem(6,1,2207,0,0,0)
AddItem(6,1,2294,0,0,0)

AddItem(6,1,1345,0,0,0)
AddItem(6,1,1986,0,0,0)
AddItem(6,1,2219,0,0,0)

AddItem(6,1,30074,0,0,0)

--banhsinhnhat

	AddItem(6,1,2859,0,0,0)
	AddItem(6,1,2860,0,0,0)
	AddItem(6,1,2861,0,0,0)
	AddItem(6,1,2862,0,0,0)
	AddItem(6,1,2863,0,0,0)
	AddItem(6,1,2867,0,0,0)
	AddItem(6,1,30094,0,0,0)
--giangsinh
AddItem(6,1,3378,0,0,0)
AddItem(6,1,3379,0,0,0)
AddItem(6,1,3384,0,0,0)
AddItem(6,1,3385,0,0,0)
AddItem(6,1,3398,0,0,0)
AddItem(6,1,3410,0,0,0)
AddItem(6,1,3414,0,0,0)
AddItem(6,1,3437,0,0,0)
AddItem(6,1,3438,0,0,0)
	
end
function get_item(nIndex)
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0, nMaxCount, "Xin mêi ®­a vµo nhËn lÊy", {get_item_back, {nIndex}})
end

function get_item_back(nIndex, nCount)
	if nCount <= 0 then
		return
	end
	if CalcFreeItemCellCount() < nCount then
		Talk(1, "", format("CÇn Ut nhÊt <color=yellow>%d<color> tói kh«ng gian...", nCount))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", %tbFreeItem[nIndex].szName)
	tbAwardTemplet:GiveAwardByList(%tbFreeItem[nIndex], szLogTitle, nCount)
end
function banhtrungthu()

--long den
AddItem(6,1,1245,0,0,0)
AddItem(6,1,1246,0,0,0)
AddItem(6,1,1243,0,0,0)
AddItem(6,1,1244,0,0,0)
AddItem(6,1,1242,0,0,0)
AddItem(6,1,1241,0,0,0)
--gianhsinh
AddItem(6,1,4209,0,0,0)
AddItem(6,1,4210,0,0,0)
AddItem(6,1,4211,0,0,0)
AddItem(6,1,4212,0,0,0)

--banh sinh nhat
AddItem(6,1,2256,0,0,0)
AddItem(6,1,2255,0,0,0)
AddItem(6,1,2662,0,0,0)
AddItem(6,1,2663,0,0,0)
AddItem(6,1,2664,0,0,0)
AddItem(6,1,2665,0,0,0)
AddItem(6,1,4114,0,0,0)




end

function abcxyz()
	n_title = 81
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
end
function abcxyz1()
	n_title = 154
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
end
function abcxyz2()
	n_title = 255
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
end
function get_single_item(nIndex)
	local tbItem = %tbFreeItem[nIndex]
	if CountFreeRoomByWH(tbItem.nWidth, tbItem.nHeigth) < 1 then
		Talk(1, "", format("CÇn Ut nhÊt 1 %dx%d µÄ±³°ü¿O¼ä", tbItem.nWidth, tbItem.nHeigth))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", tbItem.szName)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTitle)
end

function clear_attibute_point()
	local tbOpt =
	{
		{"TÈy ®iÓm kü n¨ng", clear_skill},
		{"TÈy ®iÓm tiÒm n¨ng", clear_prop},
		{"Trë vÒ", namcung2},
		{"KOt thóc ®èi tho¹i."},
	}
	CreateNewSayEx("<npc>Ng­¬i quyOt u muèn tÈy tñy?", tbOpt)
end

function clear_skill()
	local tbOpt =
	{
		{"X¸c nhËn", do_clear_skill},
		{"§Ó ta suy nghÜ l¹i."},
		{"Trë vÒ", clear_attibute_point},
	}
	CreateNewSayEx("<npc>Ng­¬i vÉn quyOt u muèn tÈy tñy?", tbOpt)
end

function do_clear_skill()
	local i = HaveMagic(210)		-- Çá¹¦ÁíÍâ²Ù×÷
	local j = HaveMagic(400)		-- ¡°½Ù¸»¼ÃÆ¶¡±ÁíÍâ²Ù×÷
	local n = RollbackSkill()		-- Çå³ý¼¼ÄÜ²¢·µ»ØËùÓÐ¼¼ÄÜ?ã£¨°üÀ¨Çá¹¦µÈÌØÊâ¼¼ÄÜ£?
	local x = 0
	if (i ~= -1) then i = 1; x = x + i end		-- ÕâÁ½¾äÅÐ¶ÏÊÇÅÅ³ý´ÓÎ´Ñ§¹ýÇá¹¦µÄÈË·µ»Ø-1´Ó¶øµ¼ÖÂµãÊý¼ÆËã´íÎóÇé¿ö
	if (j ~= -1) then x = x + j end
	local rollback_point = n - x			-- °Ñ¼¼ÄÜµãµ±×ö¿ÕÏÐµãÊý·µ»¹£¬µ«ÏÈ?Û³ýÇá¹¦µ?
	if (rollback_point + GetMagicPoint() < 0) then		-- Èç¹ûÏ´³ÉÁË¸ºÊý£¬Ôòµ±×÷0£¨ÎªÒÔºó¶à´ÎÏ´µã±£?ô£?
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210, i) end			-- Èç¹ûÑ§¹uÇá¹¦Ô?¼Ó»ØÔ­ÓÐµÈ¼¶
	if (j ~= -1) then AddMagic(400, j) end			-- Èç¹ûÑ§¹u¡°½Ù¸»¼AÆ¶¡±Í¬Ñù´¦Àí
	Msg2Player("TÈy tñy thµnh c«ng! Ng­¬i ca "..rollback_point.." ®iÓm kü n¨ng ®Ó ph©n phèi l¹i.")
	KickOutSelf()
end

function clear_prop()
	local tbOpt =
	{
		{"X¸c nhËn", do_clear_prop},
		{"§Ó ta suy nghÜ l¹i."},
		{"Trë vÒ", clear_attibute_point},
	}
	CreateNewSayEx("<npc>Ng­¬i vÉn quyOt u muèn tÈy tñy?", tbOpt)
end

function do_clear_prop()
	local base_str = {35,20,25,30,20}			-- ÎåÐÐÈËÎïµÄÌìÉúÊôÐÔÖµ
	local base_dex = {25,35,25,20,15}
	local base_vit = {25,20,25,30,25}
	local base_eng = {15,25,25,20,40}
	local player_series = GetSeries() + 1

	local Utask88 = GetTask(88)
	AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))			-- ½«ÒÑ·ÖÅäÇ±ÄÜÖØÖÃ£¨task(88)ÊÇÈÎÎñÖÐÖ±½Ó½±ÀøµÄÁ¦Á¿¡¢Éí·¨µÈ£©
	AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
	AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
	AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end

function write_info()
	tbInputDialog:InputServer()
end