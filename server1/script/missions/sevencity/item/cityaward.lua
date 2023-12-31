-- 攻城礼包使用脚本
Include("\\script\\lib\\awardtemplet.lua")

--Gi韎 h筺 甶觤 kinh nghi謒 m鏸 ng祔 l� 50tri謚 khi s� d鬾g c竎 lo筰 b秓 rng - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName="觤 kinh nghi謒 1", 
--				pFun = function (tbItem, nItemCount, szLogTitle)
--					%tbvng_ChestExpAward:ExpAward(1500000, "C玭g Th祅h L� Bao (m韎)")
--				end,
--				nRate = 60,
--	},
	{szName="觤 kinh nghi謒 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "C玭g Th祅h L� Bao (m韎)")
				end,
				nRate = 97.20,
	},
	{szName="觤 kinh nghi謒 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "C玭g Th祅h L� Bao (m韎)")
				end,
				nRate = 2,
	},
	{szName="觤 kinh nghi謒 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "C玭g Th祅h L� Bao (m韎)")
				end,
				nRate = 0.05,
	},
	{szName="觤 kinh nghi謒 5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "C玭g Th祅h L� Bao (m韎)")
				end,
				nRate = 0.02,
	},
	{szName="觤 kinh nghi謒 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "C玭g Th祅h L� Bao (m韎)")
				end,
				nRate = 0.01,
	},
	{szName = "M苩 n� Nguy猲 so竔",	tbProp = {0, 11, 447, 1, 0, 0}, nRate = 0.30},
	{szName = "B竎h Ni猲 Tr﹏ L�",		tbProp = {6, 1, 2266, 1, 0, 0}, nRate = 0.25},
	{szName = "V筺 Ni猲 Tr﹏ L�",		tbProp = {6, 1, 2268, 1, 0, 0}, nRate = 0.52},
	{szName = "Thi猲 Ni猲 Tr﹏ L�",		tbProp = {6, 1, 2267, 1, 0, 0}, nRate = 0.31},	
	
--Gi韎 h筺 甶觤 kinh nghi謒 m鏸 ng祔 l� 50tri謚 khi s� d鬾g c竎 lo筰 b秓 rng - Modified by DinhHQ - 20110428
--	{nExp = 1500000,  nRate = 48.02},
--	{nExp = 2000000,  nRate = 30},
--	{nExp = 5000000,  nRate = 5},
--	{nExp = 10000000, nRate	= 3},
--	{nExp = 20000000, nRate	= 2},
--	{nExp = 50000000, nRate	= 1},	

	{szName = "Ch譨 Kh鉧 Nh� �",		tbProp = {6, 1, 2744, 1, 0, 0}, nRate = 0.1},
	{szName = "H鏽 Nguy猲 Linh L�",		tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 0.01},
	{szName = "Ng鋍 Qu竛",			tbProp = {6, 1, 2311, 1, 0, 0}, nRate = 0.01},
	{szName = "C萴 nang thay i tr阨 t",	tbProp = {6, 1, 1781, 1, 0, 0}, nRate = 0.1, tbParam = {60}},
	{szName = "Ti猲 Th秓 L� c bi謙",		tbProp = {6, 1, 1181, 1, 0, 0}, nRate = 0.1},
}

function main(nItemIndex)
	if (CalcFreeItemCellCount() < 1) then
		Say("H祅h trang 輙 nh蕋 ph秈 c� <color=red>1<color> � tr鑞g m韎 nh薾 頲 ph莕 thng.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseCityAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("total rate is wrong", rate))
	end
end

test()
