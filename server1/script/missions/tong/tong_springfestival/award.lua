-- 奖励.lua (帮会打年兽活动)
if (not __SF_AWARD_H__) then
__SF_AWARD_H__ = 1;

IncludeLib("FILESYS");
Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");
SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];



function springfestival_aword(nTongID, nWorkshopID)
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	--获得活动坊等级
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID);
	if (nLevel < 1 or nLevel > 10) then
		Say("Bang h閕 c馻 b筺 ch璦 x﹜ d鵱g T竎 Phng n祔.", 1, "Ta bi誸 r錳!/festival06_Cancal")
		return 0;
	end;
	
    local nGetCount = GetTask(SF_COUNT_ONETIME);
    local nRank = GetTask(SF_TK_RANK);
    SetTask(SF_COUNT_ONETIME, 0);
    SetTask(SF_TK_RANK, 0);
    if (nGetCount <= 0 or nRank <= 0) then
        Say("T鎛g qu秐 Ho箃 ng phng: Ngi d鮪g nh� v蒼 ch璦 甶 nh ni猲 th�, mu鑞 nh薾 thng h穣 ra s鴆 nh 畊鎖 ni猲 th� trc.", 1, "H穣 ch� xem/festival06_Cancal");
        SetTaskTemp(193, 0);
        return
    end;
    local strniaoshou = "Nguy hi觤 qu�! Ngi m韎 b� Qu竔 th� nh藀 v祇, may m� m鋓 ngi h琾 s鴆 l筰 畊鎖 Qu竔 th� 甶 r錳! в p t� l遪g d騨g c秏 c馻 ngi, ta c� ch髏 l遪g th祅h xin nh薾 cho!";
    local stryongshi = "L祄 r蕋 t鑤, ngi  d飊g ph竜 n衜 tr髇g ni猲 th� <color=yellow>"..nGetCount.."<color> l莕, x誴 h筺g th� <color=yellow>"..nRank.."<color>, y l� ph莕 thng d祅h cho ngi, h穣 nh薾 l蕐!";
    
    festival_addaward(nRank);
    local isDouble = festival_double(nLevel);--看看是否获得双倍
	if (1 == isDouble) then
		strniaoshou = "Th藅 may m緉, ngi  nh薾 頲 <color=red>ph莕 thng nh﹏ i<color>, "..strniaoshou;
		stryongshi = "Th藅 may m緉, ngi  nh薾 頲 <color=red>ph莕 thng nh﹏ i<color>, "..stryongshi;
		festival_addaward(nRank);--双倍奖励
	end;
    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
        Say(strniaoshou, 1, "Nh薾 l蕐 l� v藅./festival06_Cancal");
    else
        Say(stryongshi, 1, "Nh薾 l蕐 l� v藅./festival06_Cancal");
    end;
    SetTaskTemp(193, 0);
end;

--取出tab文件的内容
function gettabfiledata(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function festival_double(nLevel)
	local nResult = 0;
	local nSeed = random(100);
	local nRate = tonumber(gettabfiledata(SFHD_DATAFILE, nLevel + 1, 7));
	if (nSeed <= nRate * 100) then
		nResult = 1;
	end;
	return nResult;
end;

festival_tabExp = {
5000000,
4000000,
3000000,
2000000,
1500000,
1000000,
500000,
500000,
};
festival_tabRate = {
	{0 ,0 ,0 ,0.464 ,0.2 ,0.175 ,0.15 ,0.01 ,0.001 ,0 },
	{0 ,0 ,0 ,0.5562 ,0.2 ,0.145 ,0.09 ,0.008 ,0.0008 ,0 } ,
	{0 ,0 ,0.3845 ,0.3 ,0.15 ,0.1 ,0.06 ,0.005 ,0.0005 ,0 } ,
	{0 ,0 ,0.546 ,0.2 ,0.12 ,0.085 ,0.045 ,0.004 ,0 ,0 } ,
	{0 ,0 ,0.653 ,0.15 ,0.09 ,0.075 ,0.03 ,0.002 ,0 ,0.01 } ,
	{0 ,0.295 ,0.4 ,0.15 ,0.076 ,0.068 ,0.01 ,0.001 ,0 ,0 } ,
	{0.267 ,0.3 ,0.2 ,0.12 ,0.08 ,0.03 ,0.003 ,0 ,0 ,0 } ,
	{0.586 ,0.2 ,0.12 ,0.06 ,0.03 ,0.004 ,0 ,0 ,0 ,0 }
};

festival_tab_Goods = {
{"Ph骳 Duy猲 L� (Ti觰) ",	1,	122	},
{"Ph骳 Duy猲 L� (Trung) ",	1,	123	},
{"Ph骳 Duy猲 L� (Чi) ",	1,	124	},
{"Huy襫 tinh c蕄 3",	3,	147	},
{"Ti猲 Th秓 L� ",	1,	71	},
{"Huy襫 Tinh c蕄 4",	4,	147	},
{"Huy襫 Tinh c蕄 5",	5,	147	},
{"Huy襫 Tinh c蕄 6",	6,	147	},
{"Huy襫 Tinh c蕄 7",	7,	147	},
{"Ph竜 hoa ng祔 T誸",	1,	1345 },	--概率调为0，不产出
};
function festival_addaward(nRank)
    if (nRank > getn(festival_tabExp)) then
        nRank = getn(festival_tabExp);
    end;
    nRank = festival_award_rank(nRank);
    festival_expaward(nRank);
    festival_goodsaward(nRank);
--    if (nRank <= 2) then
--        local nSeed = random(1, 100);
--        if (nSeed <= 2) then
--            AddItem(0, 11, 263, 1, 0, 0, 0);
--            Msg2Player("你获得了一个<color=yellow>年兽面具<color>")
--        end;
--    end;
end;

function festival_goodsaward(nRank)
    local nGroup = GetTask(TK_GROUPID);
	local nGoodsType = festival_getgoodtype(nRank, nGroup);
	local strsay = "";
	if (festival_tab_Goods[nGoodsType][2] == 1) then
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], 1, 0, 0, 0);
	else
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], festival_tab_Goods[nGoodsType][2], 0, 0, 0);
	end;
	Msg2Player("B筺 nh薾 頲 <color=yellow>"..festival_tab_Goods[nGoodsType][1].."<color>.");
end;

function festival_getgoodtype(nRank, nGroup)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 10 do
		nRate[i] = festival_tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 10 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

function festival_expaward(nRank)
    if (nRank < 1) then
        nRank = 1;
    end;
    if (nRank > 8) then
        nRank = 8;
    end;
    local nCount = festival_tabExp[nRank];
	AddOwnExp(nCount);
	Msg2Player("B筺 nh薾 頲<color=yellow>"..nCount.."<color>甶觤 kinh nghi謒")
end;

function festival_addpkwan()
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"Trng M謓h ho祅", "Gia B祇 ho祅", "Чi L鵦 ho祅", "Cao Thi觤 ho祅", "Cao Trung ho祅", "Phi T鑓 ho祅", "B╪g Ph遪g ho祅", "L玦 Ph遪g ho祅", "H醓 Ph遪g ho祅", "чc Ph遪g ho祅"};
    return tab_pkwan_name[itemidx];
end;

function festival_award_rank(nRank)
    local nGroup = GetTask(TK_GROUPID);
    if (nGroup > SF_SMALLMAPCOUNT) then
        if (nRank == 1) then
            nRank = 3;
        else
            nRank = 8;
        end;
    end;
    return nRank;
end;

function festival06_Cancal()
    
end;

end; --// end of __SF_AWARD_H__